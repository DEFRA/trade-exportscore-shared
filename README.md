# trade-exportscore-shared
repo for shared resources for trade-exportscore apps
This pipeline supports parameter-based deployments. When the parameter is passed as TRP from the YAML file or pipeline input, only components related to TRP will be deployed. Similarly, passing PLP will trigger deployment of components related to PLP.
This helps in deploying environment-specific or component-specific resources efficiently, based on the chosen input.This pipeline supports parameter-based deployments. When the parameter is passed as TRP from the YAML file or pipeline input, only components related to TRP will be deployed. Similarly, passing PLP will trigger deployment of components related to PLP.
This helps in deploying environment-specific or component-specific resources efficiently, based on the chosen input.

  - name: prj
    displayName: Change for deploying to REF.
    type: string
    values:
      - TRP
      - PLP
    default: TRP