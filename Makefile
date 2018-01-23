APP = imicrobe-puca
VERSION = 0.0.2
EMAIL = $(CYVERSEUSERNAME)@email.arizona.edu

init:
	touch rsync.exclude
	mkdir stampede2
	touch stampede2/app.json
	touch stampede2/job.json
	touch stampede2/public-job.json
	touch stampede2/run.sh
	touch stampede2/template.sh
	touch stampede2/test.sh
	imkdir applications/$(APP)-$(VERSION)

clean:
	find . \( -name \*.conf -o -name \*.out -o -name \*.log -o -name \*.param -o -name launcher_jobfile_\* \) -exec rm {} \;

test:
	sbatch test.sh

submit-test-job:
	jobs-submit -F stampede2/job.json

submit-public-test-job:
	jobs-submit -F stampede2/public-job.json

files-delete:
	files-delete -f $(CYVERSEUSERNAME)/applications/$(APP)-$(VERSION)

files-upload:
	files-upload -F stampede2/ $(CYVERSEUSERNAME)/applications/$(APP)-$(VERSION)

apps-addupdate:
	apps-addupdate -F stampede2/app.json

deploy-app: clean files-delete files-upload apps-addupdate

share-app:
	systems-roles-addupdate -v -u <share-with-user> -r USER tacc-stampede2-$(CYVERSEUSERNAME)
	apps-pems-update -v -u <share-with-user> -p READ_EXECUTE $(APP)-$(VERSION)

lytic-rsync-dry-run:
	rsync -n -arvzP --delete --exclude-from=rsync.exclude -e "ssh -A -t hpc ssh -A -t lytic" ./ :project/imicrobe/apps/imicrobe-puca

lytic-rsync:
	rsync -arvzP --delete --exclude-from=rsync.exclude -e "ssh -A -t hpc ssh -A -t lytic" ./ :project/imicrobe/apps/imicrobe-puca

stampede2-rsync-dry-run:
	rsync -n -arvzP --delete --exclude-from=rsync.exclude -e "ssh -A -t stampede2" ./ :project/imicrobe/apps/imicrobe-puca

stampede2-rsync:
	rsync -arvzP --delete --exclude-from=rsync.exclude -e "ssh -A -t stampede2" ./ :project/imicrobe/apps/imicrobe-puca
