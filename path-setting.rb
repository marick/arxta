require 'ramaze'

module Locations

  def self.adjust_load_paths
    $:.delete('.')
    restrict_load_path_to_defaults
    make_third_party_libs_and_gems_available
  end

  def self.restrict_load_path_to_defaults
    require 'rbconfig'
    $:.delete_if { | p | p =~ Regexp.new(RbConfig::CONFIG['sitedir']) }
    ENV['RUBYLIB'].split(':').each do | path |
      $:.delete(path)
    end if ENV.has_key?('RUBYLIB')
  end

  def self.make_third_party_libs_and_gems_available
    $: << __DIR__ + "/third-party/lib"
    RbConfig::CONFIG['sitelibdir'] = $:.last   # Rubygems uses this
    unless require 'rubygems'
      Gem::ConfigMap[:sitelibdir] = $:.last
    end
    Gem.clear_paths
    ENV['GEM_HOME'] = __DIR__ + "/third-party/gems"
  end
end
