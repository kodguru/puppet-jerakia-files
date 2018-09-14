# PATH: /etc/jerakia/policy.d/default.rb
policy :default do

  #lookup :default do
  lookup :default, :use => [ :hiera, :access_groups_backend ] do
    datasource :file, {
      :format     => :yaml,
      :docroot    => "/var/lib/jerakia/data",
      :enable_caching => true,
      :searchpath => [
        "fqdn/#{scope[:fqdn]}",
        "profiles/#{scope[:profile]}",
        plugin.access_groups_backend.access_hierarchy,
        # team_groups not yet tested
        plugin.access_groups_backend.team_group_hierarchy,
        plugin.access_groups_backend.group_hierarchy,
        "vas/#{scope[:vas_domain]}",
        "domain/#{scope[:domain]}",
        "environment/#{scope[:environment]}",
        "osfamily/#{scope[:osfamily]}",
        "common",
      ],
    }
  end
end
