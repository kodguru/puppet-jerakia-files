class Jerakia::Lookup::Plugin
  module Access_groups_backend
 
    # Team group not tested
    def team_group_hierarchy

      team_groups = scope[:team_groups].to_s.split(/,/)
      team = scope[:team] || []
      team_groups_out = []
      until team.empty?
        until team_groups.empty?
          team = team.shift
          team_group = team_groups.shift
          team_groups_out << "team/#{team}/groups/#{team_group}"
        end
      end

      team_groups_out
    end  # end of def1

    def group_hierarchy
      #groups = scope[:groups].split(/,/)
      groups = scope[:groups].to_s.split(/,/)
      groups_out = []
      until groups.empty?
        group = groups.shift
        groups_out << "groups/#{group}"
        #group = groups.pop
      end
      groups_out
    end  # end of def2
  
    def access_hierarchy
      access = scope[:access].to_s.split(/,/)
      access_output = []
      until access.empty?
        rules = access.shift
        access_output << "access/#{rules}"
      end
      access_output
    end  # end of def3

  end
end 
