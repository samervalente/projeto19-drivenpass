import joi, { string } from "joi"


const secureNoteSchema = joi.object({
    title: joi.string().max(50).required(),
    note: joi.string().max(1000).required()
})

export default secureNoteSchema