{ config, ... }:
{
  sops.secrets."paperless/admin" = { };
  services.paperless = {
    enable = true;
    configureTika = true;
    passwordFile = config.sops.secrets."paperless/admin".path;
    settings = {
      PAPERLESS_OCR_LANGUAGE = "deu+eng";
    };
  };
}
