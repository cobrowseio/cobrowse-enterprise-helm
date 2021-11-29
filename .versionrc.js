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
    prebump:
      './scripts/ensure-github-token.sh && ./scripts/generate-component-changelog.sh > .release-notes.tmpl.md',
    postbump:
      'helm package . -d packages && helm repo index packages --url https://cobrowseio.github.io/cobrowse-enterprise-helm/packages ; git add packages ; git commit -m "build(helm): package helm chart" ; sed "s/{VERSION}/$(./scripts/get-chart-version.sh)/" .release-notes.tmpl.md | hub release create -d -F- v$(./scripts/get-chart-version.sh)',
  },
  commitUrlFormat: "#",
  compareUrlFormat: "#",
  issueUrlFormat: "#",
  userUrlFormat: "#"
}
