# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include traefik2
class traefik2 (
  Stdlib::Absolutepath $bin_dir,
  Stdlib::Absolutepath $config_dir,
  Stdlib::Absolutepath $data_dir,
  Hash $dynamic_config,
  Enum['archive','package'] $install_method,
  Boolean $manage_service,
  String[1] $package_name,
  String[1] $package_version,
  String[1] $service_name,
  Enum['systemd'] $service_provider,
  Enum['running','stopped'] $service_ensure,
  Hash $static_config,
  String[1] $version,

  Optional[Stdlib::Absolutepath] $systemd_workdir = undef
) {
  anchor { 'traefik2::begin': }
-> class{ '::traefik2::install': }
-> class{ '::traefik2::config': }
~> class{ '::traefik2::service': }
-> anchor { 'traefik2::end': }
}
