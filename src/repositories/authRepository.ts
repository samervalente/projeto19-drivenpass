
import connection from "../database/postgres";

export interface IUserData{
    id: number;
    email: string;
    password: string;
}

export type authDataType = Omit<IUserData, 'id'>

export async function getUserByEmail(email: string){
    const {rows: user} = await connection.query<IUserData>("SELECT * FROM users WHERE email = $1 ", [email])
    return user[0]
}


export async function insertUser(userData: authDataType){
    const {email, password} = userData
    await connection.query(`INSERT INTO users (email, password) VALUES ($1, $2)`,[email, password])
}