import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateInvoiceDto } from './dto/create-invoice.dto';

@Injectable()
export class BillingService {
    constructor(private prisma: PrismaService) { }

    async createInvoice(data: CreateInvoiceDto) {
        // Logic to create invoice (e.g. for Cron job)
        return this.prisma.invoice.create({
            data: {
                subscriptionId: data.subscriptionId,
                amount: data.amount,
                month: new Date().getMonth() + 1,
                year: new Date().getFullYear(),
                dueDate: new Date(new Date().setDate(new Date().getDate() + 7)), // Due in 7 days
            }
        });
    }

    async getUserInvoices(userId: string) {
        return this.prisma.invoice.findMany({
            where: {
                subscription: {
                    userId: userId,
                },
            },
            include: {
                subscription: true,
            },
        });
    }
}
