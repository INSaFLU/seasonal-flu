import json
import os

localrules: bypass_ha_clades

rule bypass_ha_clades:
     output:
         node_data = "builds/{build_name}/ha/clades.json"
     run:
         os.makedirs(os.path.dirname(output.node_data), exist_ok=True)
         with open(output.node_data, "w") as fh:
             json.dump({"nodes": {}}, fh)

ruleorder: bypass_ha_clades > clades

