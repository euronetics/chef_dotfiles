#
# Cookbook Name:: chef_dotfiles
# Recipe:: default
#
node["chef_dotfiles"]["users"].each do |username|
  home_path = File.expand_path("~#{username}")
  install_path = "#{home_path}/dotfiles"

  git install_path do
    repository node["chef_dotfiles"]["repo"]
    user username
    group username
    reference "master"
    action :sync
  end

  node["chef_dotfiles"]["files"].each do |file|
    directory "#{home_path}/.#{file}" do
      recursive true
      action :delete
      not_if {File.symlink?("#{home_path}/.#{file}")}
    end

    file "#{home_path}/.#{file}" do
      not_if {File.directory?("#{home_path}/.#{file}")}
      action :delete
    end

    link "#{home_path}/.#{file}" do
      owner username
      group username
      to "#{install_path}/#{file}"
    end
  end
end
