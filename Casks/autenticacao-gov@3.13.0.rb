cask "autenticacao-gov@3.13.0" do
  version "3.13.0,5498"
  sha256 "e1a8a79c01385b7f9cfc345108e1f9bd38304361357d2eefb70ecdb666453c12"

  url "https://github.com/amagovpt/autenticacao.gov/releases/download/v3.13.0/Autenticacao.gov_MacOS-3.13.0-Signed.pkg"
  name "Autenticação.gov"
  desc "Middleware oficial de identificação eletrónica de Portugal (Cartão de Cidadão)"
  homepage "https://github.com/amagovpt/autenticacao.gov"

  pkg "Autenticacao.gov_MacOS-3.13.0-Signed.pkg"

  conflicts_with cask: "autenticacao-gov"

  uninstall pkgutil: [
              "pt.cartaodecidadao.apps",
              "pt.cartaodecidadao.bin",
              "pt.cartaodecidadao.certs",
              "pt.cartaodecidadao.lib",
            ]
end
