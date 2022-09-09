import joi from "joi"

const credentialSchema = joi.object({
    title: joi.string().max(50).required(),
    url: joi.string().pattern(/[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/i).required(),
    username: joi.string().required(),
    password: joi.string().required()
})

export default credentialSchema