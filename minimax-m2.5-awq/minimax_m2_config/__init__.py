def register():
    from transformers import AutoConfig
    from minimax_m2_config.configuration_minimax_m2 import MiniMaxM2Config
    AutoConfig.register("minimax_m2", MiniMaxM2Config, exist_ok=True)
    print("[minimax-m2-config plugin] Registered MiniMaxM2Config with transformers AutoConfig")
