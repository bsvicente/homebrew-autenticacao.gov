cask "autenticacao-gov" do
  version "3.15.0"
  sha256 "4963fa0d67306e021d9b9bfee26fd372936269465d8bc7b7baacc04624d95588"

  url "https://github.com/amagovpt/autenticacao.gov/releases/download/v#{version}/Autenticacao.gov_MacOS_#{version}-Signed.pkg"
  name "Autenticação.gov"
  desc "Middleware oficial de identificação eletrónica de Portugal (Cartão de Cidadão)"
  homepage "https://github.com/amagovpt/autenticacao.gov"

  pkg "Autenticacao.gov_MacOS_#{version}-Signed.pkg"

uninstall pkgutil: [
              "pt.cartaodecidadao.apps",
              "pt.cartaodecidadao.bin",
              "pt.cartaodecidadao.certs",
              "pt.cartaodecidadao.lib",
            ]
end