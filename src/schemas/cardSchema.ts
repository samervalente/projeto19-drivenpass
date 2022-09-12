import joi from "joi"

const userSchema = joi.object({
    title:joi.string().required(),
    number: joi.number().required(),
    printName: joi.string().required(),
    securityCode:joi.number().required(),
    expirationDate:joi.string().required(),
    password: joi.string().required(),
    isVirtual:joi.boolean().required(),
    type:joi.string().valid("crédito", "débito","crédito/débito").required()
})

export default userSchema
