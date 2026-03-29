output "repository_urls" {
  description = "HTML URLs of all managed repositories"
  value = {
    pelindung_bumi_github_io = module.pelindung_bumi_github_io.html_url
    semesta                  = module.semesta.html_url
    galaksi                  = module.galaksi.html_url
    peta                     = module.peta.html_url
    samudera                 = module.samudera.html_url
    pabrik_tahu              = module.pabrik_tahu.html_url
  }
}
