# package(default_visibility = ["//visibility:public"])

#config_setting(
#    name = "raspbian",
#    values = {"cpu": "raspbian"},
#    visibility = ["//visibility:public"],
#)
#
#config_setting(
#    name = "bionic",
#    values = {"cpu": "bionic"},
#    visibility = ["//visibility:public"],
#)

constraint_setting(
    name = "is_roborio",
    default_constraint_value = ":false",
)

constraint_value(
    name = "true",
    constraint_setting = ":is_roborio",
    visibility = ["//visibility:public"],
)

constraint_value(
    name = "false",
    constraint_setting = ":is_roborio",
)

config_setting(
    name = "roborio",
    constraint_values = [":true"],
    # values = {"cpu": "roborio"},
    visibility = ["//visibility:public"],
)
