module AresMUSH
  module Scenes

    def self.custom_scene_data(char)
      sheet = char.sheet.template_config
      sheet[:id] = char.id
      sheet[:name] = char.name
      [:template, :health, :agg_wounds, :lethal_wounds, :bashing_wounds].each do |f|
        sheet[f] = char.sheet.public_send(f)
      end

      {
        is_st: CoD.is_st?(char),
        char: sheet,
        config: Global.read_config('cod', 'client'),
        settings: char.cod_settings,
        lfrp_icons: LookingForRp.web_list,
        txt_extra_installed: Manage.is_extra_installed?("txt")
      }
    end

  end
end
