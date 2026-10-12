cask "autenticacao-gov@3.11.0" do
  version "3.11.0,5015"
  sha256 "d2902d81183277340bf6ca2f3d6e5997a1733572ab3ced01d5f1c213e044884f"

  url "https://github.com/amagovpt/autenticacao.gov/releases/download/v3.11.0/Autenticacao.gov-3.11.0.5015-Signed.pkg"
  name "Autenticação.gov"
  desc "Middleware oficial de identificação eletrónica de Portugal (Cartão de Cidadão)"
  homepage "https://github.com/amagovpt/autenticacao.gov"

  pkg "Autenticacao.gov-3.11.0.5015-Signed.pkg"

  conflicts_with cask: "autenticacao-gov"

  uninstall pkgutil: [
              "pt.cartaodecidadao.apps",
              "pt.cartaodecidadao.bin",
              "pt.cartaodecidadao.certs",
              "pt.cartaodecidadao.lib",
            ]
end
