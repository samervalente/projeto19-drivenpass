import joi from "joi"

const userSchema = joi.object({
    title:joi.string().required(),
    networkName: joi.string().required(),
    networkPassword: joi.string().required()
})

export default userSchema
