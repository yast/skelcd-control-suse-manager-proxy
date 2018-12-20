require "yast/rake"

Yast::Tasks.configuration do |conf|
  # lets ignore license check for now
  conf.skip_license_check << /.*/
end

# no tarball is needed for package build
Rake::Task["tarball"].clear_actions
