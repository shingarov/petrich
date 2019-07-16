API
fileOut: aClassDescription author: author project: project
	| stream |
	stream := (String new: 1000) writeStream.
	self new
		stream: stream;
		author: author;
		project: project;
		fileOut: aClassDescription.
	FileStream writeSourceCodeFrom: stream baseName: aClassDescription name isSt: true