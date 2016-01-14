# Reads profile files from ../fhir_profiles/{title} and strips out basic type definitions 
# and items not currently used by the editor to reduce file size.

fs = require "fs"
path = require "path"

inputPath = "../fhir_profiles"
outputPath = "../public/profiles"

summarizeDirectory = (inputDirName, inputDirPath, outputFilePath) ->
	console.log "Processing #{inputDirName}"
	profiles = {}
	
	for bundleFileName in fs.readdirSync(inputDirPath)
		continue unless bundleFileName.indexOf("json") > -1
		bundleFilePath = path.join(inputDirPath, bundleFileName)
		bundle = JSON.parse fs.readFileSync(bundleFilePath)
		profiles = summarizeBundle(bundle, profiles)

	fs.writeFileSync outputFilePath,
		JSON.stringify profiles, null, "  "

summarizeBundle = (fhirBundle, profiles) ->
	for entry in fhirBundle?.entry || []
		root = entry?.resource?.snapshot?.element?[0]?.path
		continue unless root and 
			root[0] is root[0].toUpperCase()

		profiles[root] = {}
		for e, i in entry?.resource?.snapshot?.element || []
			profiles[root][e.path] =
				index: i
				path: e.path
				min: e.min
				max: e.max
				type: e.type
				isSummary: e.isSummary
				isModifier: e.isModifier
				short: e.short
				nameReference: e.nameReference
	return profiles

for inputDirName in fs.readdirSync path.join(__dirname, inputPath)
	inputDirPath = path.join(__dirname, inputPath, inputDirName)
	outputFilePath = path.join(__dirname, outputPath, inputDirName+".json")
	if fs.lstatSync(inputDirPath).isDirectory()
		summarizeDirectory(inputDirName, inputDirPath, outputFilePath)