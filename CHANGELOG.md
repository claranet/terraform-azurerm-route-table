## 8.0.0 (2024-10-11)

### ⚠ BREAKING CHANGES

* **AZ-1088:** AzureRM Provider v4+ and OpenTofu 1.8+

### Features

* **AZ-1088:** module v8 structure and updates df0a021

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.3 8d474ea
* **deps:** update dependency pre-commit to v4 063fbba
* **deps:** update dependency pre-commit to v4.0.1 2907456
* **deps:** update dependency trivy to v0.56.1 63dbb6c
* **deps:** update dependency trivy to v0.56.2 7a28815
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 3adb233
* prepare for new examples structure 78740c2
* update examples structure 43c2fdf

## 7.1.0 (2024-10-03)

### Features

* use Claranet "azurecaf" provider c677d2f

### Documentation

* update README badge to use OpenTofu registry 8082a48

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.2 7bb37ff
* **deps:** update dependency terraform-docs to v0.19.0 d0ad4ad
* **deps:** update dependency trivy to v0.55.0 5fab341
* **deps:** update dependency trivy to v0.55.1 988c6c5
* **deps:** update dependency trivy to v0.55.2 55b19c3
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 635d1e8
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 fd4004c
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 f62abea
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 bea8da6
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 5423bb6
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 8f7dbf4

## 7.0.0 (2024-09-03)

### ⚠ BREAKING CHANGES

* **AZ-840:** minimum TF version `v1.3+`, provider AzureRM `v3.0+`

### Features

* **AZ-840:** prepare v7 170af39

### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] eb07a98
* **AZ-1391:** update semantic-release config [skip ci] b3ec3cf

### Miscellaneous Chores

* **deps:** enable automerge on renovate d862bf2
* **deps:** update dependency opentofu to v1.7.0 b4c7241
* **deps:** update dependency opentofu to v1.7.1 f8cf89f
* **deps:** update dependency opentofu to v1.7.2 b814470
* **deps:** update dependency opentofu to v1.7.3 682f284
* **deps:** update dependency opentofu to v1.8.0 55e6871
* **deps:** update dependency opentofu to v1.8.1 5c41677
* **deps:** update dependency pre-commit to v3.7.1 22370f4
* **deps:** update dependency pre-commit to v3.8.0 bf68dcd
* **deps:** update dependency terraform-docs to v0.18.0 9981bd2
* **deps:** update dependency tflint to v0.51.0 4d5c04e
* **deps:** update dependency tflint to v0.51.1 cd476b8
* **deps:** update dependency tflint to v0.51.2 e2f9690
* **deps:** update dependency tflint to v0.52.0 d8e9790
* **deps:** update dependency tflint to v0.53.0 63ef153
* **deps:** update dependency trivy to v0.50.2 aee5244
* **deps:** update dependency trivy to v0.50.4 ca654fc
* **deps:** update dependency trivy to v0.51.0 c011fa8
* **deps:** update dependency trivy to v0.51.1 0e230a2
* **deps:** update dependency trivy to v0.51.2 9059db3
* **deps:** update dependency trivy to v0.51.4 178b107
* **deps:** update dependency trivy to v0.52.0 3fb8d2d
* **deps:** update dependency trivy to v0.52.1 96d7c3a
* **deps:** update dependency trivy to v0.52.2 29c9ed8
* **deps:** update dependency trivy to v0.53.0 110d9fc
* **deps:** update dependency trivy to v0.54.1 095a9e3
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 3a4545f
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 e8814bf
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 75e03e2
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.2 93b2961
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 68134bb
* **deps:** update renovate.json 77cd0e0
* **pre-commit:** update commitlint hook caf906d
* **release:** remove legacy `VERSION` file 68d932e

# v5.2.0 - 2022-11-23

Changed
  * AZ-908: Use the new data source for CAF naming (instead of resource)

# v5.1.0 - 2022-04-15

Added
  * AZ-615: Add an option to enable or disable default tags

# v5.0.0 - 2022-02-03

Breaking
  * AZ-515: Option to use Azure CAF naming provider to name resources
  * AZ-515: Require Terraform 0.13+

Changed
  * AZ-572: Revamp examples and improve CI

# v3.1.1/v4.1.1 - 2021-08-27

Changed
  * AZ-532: Revamp README with latest `terraform-docs` tool
  * AZ-530: Cleanup module, fix linter errors

# v3.1.0/v4.1.0 - 2012-12-16

Changed
  * AZ-398: Force lowercases on default generated name

# v3.0.1/v4.0.0 - 2020-11-19

Updated
  * AZ-273: Module now compatible terraform `v0.13+`

# v3.0.0 - 2020-07-03

Updated
  * AZ-206: Don't pin AzureRM provider version to 1.x, now compatible 2.x+
  * AZ-209: Include our generic Gitlab CI template

# v2.0.0 - 2019-12-18

Add
  * AZ-117: Open Source + Terraform registry
  
Breaking
  * AZ-94: Upgrade to terraform 0.12

# v0.1.0 - 2019-07-12

Added
  * AZ-92: First version
