require "yast/rake"

Yast::Tasks.submit_to :sle15sp6

Yast::Tasks.configuration do |conf|
  # lets ignore license check for now
  conf.skip_license_check << /.*/
end

# no tarball is needed for package build
Rake::Task["tarball"].clear_actions

CONTROL_SCHEMA = "/usr/share/YaST2/control/control.rng".freeze
XSL_FILE = "package/installation.suse-manager-proxy.xsl".freeze
DEFAULT_BASE_XML = "/usr/share/installation-products/SLES.xml".freeze
# allow using a custom base SLES file e.g. from a Git checkout
BASE_XML = ENV["BASE_XML"] || DEFAULT_BASE_XML
TARGET_XML = "installation.suse-manager-proxy.xml".freeze

file TARGET_XML => [ XSL_FILE, BASE_XML ] do
  sh "xsltproc", "--output", TARGET_XML, XSL_FILE, BASE_XML
end

desc "Build the XML (set the base SLES file via $BASE_XML, default: #{DEFAULT_BASE_XML})"
task :build => TARGET_XML.to_sym

desc "Validate the built XML"
task :"test:validate" => TARGET_XML do
  begin
    # prefer using jing for validation
    sh "jing", CONTROL_SCHEMA, TARGET_XML
    puts "OK"
  rescue Errno::ENOENT
    # fallback to xmllint
    sh "xmllint", "--noout", "--relaxng", CONTROL_SCHEMA, TARGET_XML
  end
end

desc "Remove the generated XML file"
task :clean do
  rm TARGET_XML if File.exist?(TARGET_XML)
end
