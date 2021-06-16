// .versionrc.js
const tracker = {
  filename: 'Chart.yaml',
  updater: {
    readVersion: function(contents) {
      return contents.match(/version: (.*)/)[1]
    },
    writeVersion: function (contents, version) {
      return contents.replace(/version:.*/, `version: ${version}`)
    }
  }
}

module.exports = {
  packageFiles: [tracker],
  bumpFiles: [tracker],
  scripts: {
    postbump: "helm package . -d packages && helm repo index packages --url https://cobrowseio.github.io/cobrowse-enterprise-helm/packages ; git add packages ; git commit -m \"build(helm): package helm chart\""
  },
  commitUrlFormat: "#",
  compareUrlFormat: "#",
  issueUrlFormat: "#",
  userUrlFormat: "#"
}
