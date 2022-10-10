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
  header: '# Changelog\n\nThis is the changelog for the helm chart only. For the full enterprise release changelog please see [here](https://github.com/cobrowseio/cobrowse-enterprise-helm/releases/tag/v{VERSION})\n',
  packageFiles: [tracker],
  bumpFiles: [tracker],
  scripts: {
    prebump:
      './scripts/ensure-github-token.sh && ./scripts/generate-component-changelog.sh > .release-notes.tmpl.md',
    postbump:
      'helm package . -d packages && helm repo index packages --url https://cobrowseio.github.io/cobrowse-enterprise-helm/packages ; git add packages ; git commit -m "build(helm): package helm chart" ; sed "s/{VERSION}/$(./scripts/get-chart-version.sh)/" .release-notes.tmpl.md | hub release create -d -F- v$(./scripts/get-chart-version.sh)',
    postchangelog:
      'sed -i.bak "s/{VERSION}/$(./scripts/get-chart-version.sh)/" CHANGELOG.md && rm CHANGELOG.md.bak'
  },
  commitUrlFormat: "#",
  compareUrlFormat: "#",
  issueUrlFormat: "#",
  userUrlFormat: "#"
}
