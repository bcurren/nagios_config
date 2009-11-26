require 'treetop'
require 'spec/rake/spectask'

CODE_ROOT='lib/nagios_config'
PARSER_FILE="#{CODE_ROOT}/nagios_config_parser.rb"
GRAMMAR_FILE="grammar/nagios_config.treetop"

task :default => :spec

namespace :generate do
  desc "Generate parser from treetop grammar."
  task :parser => PARSER_FILE
end

desc "Run specs and generate parser"
task :spec => ['generate:parser', 'spec_internal']

Spec::Rake::SpecTask.new do |t|
  t.pattern = 'spec/**/*spec.rb'
  t.name = 'spec_internal'
end

file PARSER_FILE => GRAMMAR_FILE do |t|
  require 'treetop'
  mkdir_p CODE_ROOT
  compiler = Treetop::Compiler::GrammarCompiler.new
  compiler.compile(t.prerequisites[0], t.name)
end
