import pkg, { prisma } from "@prisma/client";

const { PrismaClient } = pkg
const client = new PrismaClient()

export default client