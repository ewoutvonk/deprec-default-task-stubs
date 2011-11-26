# Copyright (c) 2009-2011 by Ewout Vonk. All rights reserved.

# prevent loading when called by Bundler, only load when called by capistrano
if caller.any? { |callstack_line| callstack_line =~ /^Capfile:/ }
  unless Capistrano::Configuration.respond_to?(:instance)
    abort "deprec-default-task-stubs requires Capistrano 2"
  end

  DEPREC_STANDARD_TASKS = [
    :install,
    :config_gen,
    :config_project_gen,
    :config_system_gen,
    :config,
    :config_project,
    :config_system,
    :start,
    :stop,
    :restart,
    :reload,
    :activate,
    :deactivate,
    :backup,
    :restore,
    :status
  ]

  def define_default_task_stubs(base_namespace)
    Capistrano::Configuration.instance.send(base_namespace).namespaces.keys.each do |ns_name|
      ns = Capistrano::Configuration.instance.send(base_namespace).send(ns_name)
      DEPREC_STANDARD_TASKS.each do |standard_task|
        unless ns.respond_to?(standard_task)
          Capistrano::Configuration.instance.namespace base_namespace do
            namespace ns_name do
              task standard_task do
                # nothing to be done here, just a task stub
              end
            end
          end
        end
      end
    end
  end

  define_default_task_stubs(:deprec)
end