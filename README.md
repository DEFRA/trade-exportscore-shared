---
## How It Works
- When the pipeline parameter is set to `TRP`, **TRP components** will be deployed.
- When the parameter is set to `PLP`, **PLP components** will be deployed.
- This logic can be extended to support additional modules as needed.
---
## Example: Azure DevOps YAML
```yaml
parameters:
 - name: ComponentType
   type: string
   default: 'TRP'
stages:
 - stage: Deploy
   displayName: 'Deploy Selected Component'
   jobs:
     - job: DeployComponent
       steps:
         - template: deploy-component.yml
           parameters:
             ComponentType: ${{ parameters.ComponentType }}
