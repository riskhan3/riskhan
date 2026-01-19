import { Controller, Get, Post, Body, Param, UseGuards, Request } from '@nestjs/common';
import { BillingService } from './billing.service';
import { AuthGuard } from '@nestjs/passport';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { CreateInvoiceDto } from './dto/create-invoice.dto';

@ApiTags('Billing')
@ApiBearerAuth()
@UseGuards(AuthGuard('jwt'))
@Controller('billing')
export class BillingController {
    constructor(private readonly billingService: BillingService) { }

    @Post('invoice')
    @ApiOperation({ summary: 'Create a new invoice (Admin/System)' })
    createInvoice(@Body() createInvoiceDto: CreateInvoiceDto) {
        return this.billingService.createInvoice(createInvoiceDto);
    }

    @Get('invoices')
    @ApiOperation({ summary: 'Get all invoices for current user' })
    getUserInvoices(@Request() req: any) {
        // Mock data logic using req.user.id if needed
        return this.billingService.getUserInvoices(req.user.userId);
    }
}
