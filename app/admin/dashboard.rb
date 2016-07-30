ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end

# For the entire application:
ActiveAdmin.setup do |config|
  config.comments = false
end

ActiveAdmin.register UiControl do
  permit_params :kind

  index do
    selectable_column
    column :id do |ui_control|
      link_to ui_control.id, admin_ui_control_path(ui_control)
    end
    column :type do |ui_control|
      ui_control.kind.capitalize
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :type do
        ui_control.kind.capitalize
      end
    end
  end
end

ActiveAdmin.register Control do
  permit_params :display_name, :ui_control_id

  index do
    selectable_column
    column :id do |control|
      link_to control.id, admin_control_path(control)
    end
    column :display_name
    column :type do |control|
      control.ui_control.kind.capitalize
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :display_name
      row :type do
        control.ui_control.kind.capitalize
      end
    end
  end

  form do |f|
    f.inputs "Details" do # Project's fields
      f.input :display_name
      f.input :ui_control, as: :radio, collection: UiControl.all.map { |c| [c.kind, c.id] }
    end
    f.actions
  end
end

ActiveAdmin.register DeviceType do
  permit_params :name, :control_ids => []

  index do
    selectable_column
    column :id do |device_type|
      link_to device_type.id, admin_device_type_path(device_type)
    end
    column :name
    column :controls do |device_type|
      device_type.controls.map(&:display_name).map(&:capitalize).join(', ')
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :controls do
        device_type.controls.map(&:display_name).map(&:capitalize).join(', ')
      end
    end
  end

  form do |f|
    f.inputs "Details" do # Project's fields
      f.input :name
    end
    f.inputs "Controls" do
      f.input :controls, as: :check_boxes, collection: Control.all
    end
    f.actions
  end
end

ActiveAdmin.register Device do
  permit_params :name, :device_type_id, :ip_address

  index do
    selectable_column
    column :id do |device|
      link_to device.id, admin_device_path(device)
    end
    column :name
    column :ip_address
    column :type do |device|
      device.device_type.name
    end
    column :controls do |device|
      device.device_type.controls.map(&:display_name).map(&:capitalize).join(', ')
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :ip_address
      row :device_type
      row :controls do
        device.device_type.controls.map(&:display_name).map(&:capitalize).join(', ')
      end
    end

  end
end
