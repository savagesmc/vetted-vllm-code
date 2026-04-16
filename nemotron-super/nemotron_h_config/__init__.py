def register():
    from transformers import AutoConfig
    from nemotron_h_config.configuration_nemotron_h import NemotronHConfig
    AutoConfig.register("nemotron_h", NemotronHConfig, exist_ok=True)
    print("[nemotron-h-config plugin] Registered NemotronHConfig with transformers AutoConfig")
