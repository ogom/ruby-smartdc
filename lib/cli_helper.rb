require 'thor'
require 'thor/group'
require 'terminal-table'
require 'smartdc'
require 'configure'
include Configure

def config(options={})
  cfg = Configure.read

  if !options.empty?
    options.each do |key, value|
      cfg[key.to_sym] = value
    end
  end

  cfg
end

def sdc(options)
  Smartdc.new(options)
end

def opt(argument, options={})
  opts = {}
  opts = opts.merge(options)
  opts['raw'] = true if argument.include?('--raw') or argument.include?('-r')
  opts['debug'] = true if argument.include?('--debug') or argument.include?('-d')
  opts
end

def output(response, options={})
  if options['raw']
    puts response.body
  else
    if response.status < 300
      if options[:table]
        case options[:table]
        when :h
          puts horizontal(response.content, options)
        when :v
          puts vertical(response.content, options)
        end
      else
        if options[:message]
          puts options[:message]
        else
          puts response.content[options[:only].to_s]
        end
      end
    else
      puts vertical(response.content)
    end
  end
end

def horizontal(content, options={})
  options[:include] ||= []
  options[:exclude] ||= []
  rows = []
  headings = nil
    
  content.each do |row|
    options[:exclude].each do |col|
      row.delete(col.to_s)
    end

    if !options[:include].empty?
      cols = {}
      options[:include].each do |col|
        cols[col.to_s] = row[col.to_s] if row.key?(col.to_s)
      end
      row = cols
    end

    rows << row.values
    headings = row.keys if headings.nil?
  end

  Terminal::Table.new :headings => headings, :rows => rows if !content.empty?
end

def vertical(content, options={})
  options[:exclude] ||= []
  options[:exclude].each do |col|
    content.delete(col.to_s)
  end

  rows = []
  content.to_a.each do |row|
    rows << row
  end
  
  Terminal::Table.new :headings => ['key','value'], :rows => rows if !content.empty?
end

def describe(name, content, options)
  if options['all'] or options['output'] == name
    options[:exclude] ||= []
    rows = []

    content[name].each do |row|
      cols = []
      if options[:cols] == :all
        options[:exclude].each do |col|
          row.delete(col.to_s)
        end
        cols = row.values
      else
        options[:cols].each do |col|
          if col == 'key'
            cols << row[0]
          else
           cols << row[1][col] 
          end
        end
      end
      rows << cols
    end

    title = options['all'] ? name : nil
    headings = options[:cols] == :all ? content[name][0].keys : options[:cols]
    puts Terminal::Table.new :title => title, :headings => headings, :rows => rows
    puts if options['all']
  end
end
