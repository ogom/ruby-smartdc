module Smartdc::Cli
  class Analytic < Thor
    include Smartdc::CliHelper

    desc 'desc', 'Retrieves the schema for instrumentations.'
    method_option :all, type: :boolean, desc: 'All describe.'
    method_option :output, type: :string, default: 'metrics', aliases: '-o',
                  desc: 'Only output the modules or fields or types or metrics or transformations.'
    def desc
      if options['raw']
        puts Smartdc.describe_analytics.body
      else
        content = Smartdc.describe_analytics.content
        describe('modules', content, options.merge(cols: %w[key label]))
        describe('fields', content, options.merge(cols: %w[key label type]))
        describe('types', content, options.merge(cols: %w[key name arity unit abbr base power]))
        describe('metrics', content, options.merge(cols: :all, exclude: %i[fields]))
        describe('transformations', content, options.merge(cols: %w[key label]))
      end
    end

    desc 'list', 'Retrieves all currently created instrumentations.'
    def list
      output Smartdc.analytics, options.merge(table: :horizontal, include: %i[
        id module stat decomposition
      ])
    end

    desc 'show [ID]', 'Retrieves the configuration for an instrumentation.'
    method_option :value, type: :boolean, aliases: '-v', desc: 'Analytic value.'
    def show(id)
      if options[:value]
        output Smartdc.value_analytic(id), options.merge({table: :vertical})
      else
        output Smartdc.analytic(id), options.merge(table: :vertical, exclude: %i[uris])
      end
    end

    desc 'add [NAME]', 'Creates an instrumentation.'
    method_option :module, type: :string, aliases: '-m', desc: 'The Cloud analytics module'
    method_option :stat, type: :string, aliases: '-s', desc: 'The Cloud analytics stat'
    def add
      body = {module: options[:module], stat: options[:stat]}
      output Smartdc.create_analytic(body), options.merge(table: :vertical, exclude: %i[uris])
    end

    desc 'destroy [ID]', 'Destroys an instrumentation.'
    def destroy(id)
      output Smartdc.destroy_analytic(id), options.merge(message: "Analytic #{id} destroy.")
    end
  end
end
