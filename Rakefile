domain = "me.zhaowu"
workflow = "google"
workflow_home=File.expand_path("~/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows")

# task :chdir do
#   Dir.chdir("workflow_home")
# end

desc "Install"
task :install => [] do
  ln_sf File.realpath(workflow), File.join(workflow_home, "#{domain}.#{workflow}")
end

desc "Uninstall"
task :uninstall => [] do
  rm File.join(workflow_home, "#{domain}.#{workflow}")
end

