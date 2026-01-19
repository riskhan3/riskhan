import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateTicketDto } from './dto/create-ticket.dto';

@Injectable()
export class TicketsService {
    constructor(private prisma: PrismaService) { }

    async createTicket(userId: string, data: CreateTicketDto) {
        return this.prisma.ticket.create({
            data: {
                userId,
                ...data,
            },
        });
    }

    async getUserTickets(userId: string) {
        return this.prisma.ticket.findMany({
            where: { userId },
            orderBy: { createdAt: 'desc' },
        });
    }
}
