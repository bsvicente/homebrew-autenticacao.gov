cask "autenticacao-gov@3.14.0" do
  version "3.14.0,5945"
  sha256 "842c5dcd7756980877c0a7a242716cb904573fbb71019798fd53dc0fd8040401"

  url "https://github.com/amagovpt/autenticacao.gov/releases/download/v3.14.0/Autenticacao.gov_MacOS-3.14.0.5945-Signed.pkg"
  name "Autenticação.gov"
  desc "Middleware oficial de identificação eletrónica de Portugal (Cartão de Cidadão)"
  homepage "https://github.com/amagovpt/autenticacao.gov"

  pkg "Autenticacao.gov_MacOS-3.14.0.5945-Signed.pkg"

  conflicts_with cask: "autenticacao-gov"

  uninstall pkgutil: [
              "pt.cartaodecidadao.apps",
              "pt.cartaodecidadao.bin",
              "pt.cartaodecidadao.certs",
              "pt.cartaodecidadao.lib",
            ]
end
