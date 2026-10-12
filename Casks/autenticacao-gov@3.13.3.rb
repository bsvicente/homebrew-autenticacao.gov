cask "autenticacao-gov@3.13.3" do
  version "3.13.3,5680"
  sha256 "b818aa7dd0e9caeef2cfa4cd90773f92429f5e3a616ca9897d0e1ac3f068e98a"

  url "https://github.com/amagovpt/autenticacao.gov/releases/download/v3.13.3/Autenticacao.gov_MacOS_3.13.3.5680-Signed.pkg"
  name "Autenticação.gov"
  desc "Middleware oficial de identificação eletrónica de Portugal (Cartão de Cidadão)"
  homepage "https://github.com/amagovpt/autenticacao.gov"

  pkg "Autenticacao.gov_MacOS_3.13.3.5680-Signed.pkg"

  conflicts_with cask: "autenticacao-gov"

  uninstall pkgutil: [
              "pt.cartaodecidadao.apps",
              "pt.cartaodecidadao.bin",
              "pt.cartaodecidadao.certs",
              "pt.cartaodecidadao.lib",
            ]
end
