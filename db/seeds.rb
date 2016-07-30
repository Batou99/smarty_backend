# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

UiControl.delete_all
slider_ui = UiControl.create(kind: 'slider', values: ActiveSupport::JSON.encode((0..100).to_a), default_value: 0)
button_ui = UiControl.create(kind: 'button', values: ActiveSupport::JSON.encode([0, 1]), default_value: 0)
select_ui = UiControl.create(kind: 'select', values: ActiveSupport::JSON.encode([:a, :b, :c]), default_value: 'a')

Control.delete_all
volume_slider     = Control.create(display_name: 'Volume', ui_control: slider_ui)
brightness_slider = Control.create(display_name: 'Brightness', ui_control: slider_ui)
power_button      = Control.create(display_name: 'Power', ui_control: button_ui)
playlist_select   = Control.create(display_name: 'Playlist', ui_control: select_ui)

DeviceType.delete_all
samsung_audio = DeviceType.create(name: 'Samsung Audio', controls: [power_button, volume_slider, playlist_select])
sony_audio    = DeviceType.create(name: 'Sony Audio', controls: [power_button, playlist_select])
apple_tv      = DeviceType.create(name: 'Apple TV Video', controls: [volume_slider, brightness_slider, power_button])

Device.delete_all
Device.create(name: 'Front Audio', ip_address: '192.168.1.10', device_type: sony_audio)
Device.create(name: 'Rear Audio',  ip_address: '192.168.1.11', device_type: samsung_audio)
Device.create(name: 'Apple TV',    ip_address: '192.168.1.12', device_type: apple_tv)
