cask "autenticacao-gov" do
  version "3.16.1,6201"
  sha256 "0df1526d607242349d030ea927a08adc450aa16f0f2cb70525147f6e8ab845dc"

  url "https://github.com/amagovpt/autenticacao.gov/releases/download/v3.16.0/Autenticacao.gov_MacOS_#{version.csv.first}.#{version.csv.second}-Signed.pkg"
  name "Autenticação.gov"
  desc "Middleware oficial de identificação eletrónica de Portugal (Cartão de Cidadão)"
  homepage "https://github.com/amagovpt/autenticacao.gov"

  pkg "Autenticacao.gov_MacOS_#{version.csv.first}.#{version.csv.second}-Signed.pkg"

  uninstall pkgutil: [
              "pt.cartaodecidadao.apps",
              "pt.cartaodecidadao.bin",
              "pt.cartaodecidadao.certs",
              "pt.cartaodecidadao.lib",
            ]
end