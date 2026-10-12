cask "autenticacao-gov@3.12.0" do
  version "3.12.0,5427"
  sha256 "e209a2c4855573272997422afa287d20cd9c809e669e86648cde17e53df71fed"

  url "https://github.com/amagovpt/autenticacao.gov/releases/download/v3.12.0/Autenticacao.gov_MacOS_3.12.0.5427.pkg"
  name "Autenticação.gov"
  desc "Middleware oficial de identificação eletrónica de Portugal (Cartão de Cidadão)"
  homepage "https://github.com/amagovpt/autenticacao.gov"

  pkg "Autenticacao.gov_MacOS_3.12.0.5427.pkg"

  conflicts_with cask: "autenticacao-gov"

  uninstall pkgutil: [
              "pt.cartaodecidadao.apps",
              "pt.cartaodecidadao.bin",
              "pt.cartaodecidadao.certs",
              "pt.cartaodecidadao.lib",
            ]
end
