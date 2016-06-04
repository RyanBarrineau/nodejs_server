
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
            <xsl:template match="/">
                <Orders>
                    <xsl:for-each select="orders/order">
                        <Order>
                            <orderno><xsl:value-of select="increment_id"/></orderno>
                            <xsl:variable name="incrementid" select="increment_id"/>
                            <email><xsl:value-of select="customer_email"/></email>
                            <billing>
                                <prefix><xsl:value-of select="billing/prefix"/></prefix>
                                <firstname><xsl:value-of select="billing/firstname"/></firstname>
                                <lastname><xsl:value-of select="billing/lastname"/></lastname>
                                <company><xsl:value-of select="billing/company"/></company>
                                <street><xsl:value-of select="billing/street1"/></street>
                                <street2><xsl:value-of select="billing/street2"/></street2>
                                <city><xsl:value-of select="billing/city"/></city>
                                <ST><xsl:value-of select="billing/region_code"/></ST>
                                <region><xsl:value-of select="billing/region"/></region>
                                <postcode><xsl:value-of select="billing/postcode"/></postcode>
                                <country_id><xsl:value-of select="billing/country_id"/></country_id>
                                <telephone><xsl:value-of select="billing/telephone"/></telephone>
                                <mobile><xsl:value-of select="billing/fax"/></mobile>
                            </billing>
                            <shipping>
                                <prefix><xsl:value-of select="shipping/prefix"/></prefix>
                                <firstname><xsl:value-of select="shipping/firstname"/></firstname>
                                <lastname><xsl:value-of select="shipping/lastname"/></lastname>
                                <company><xsl:value-of select="shipping/company"/></company>
                                <street><xsl:value-of select="shipping/street1"/></street>
                                <street2><xsl:value-of select="shipping/street2"/></street2>
                                <city><xsl:value-of select="shipping/city"/></city>
                                <ST><xsl:value-of select="shipping/region_code"/></ST>
                                <region><xsl:value-of select="shipping/region"/></region>
                                <postcode><xsl:value-of select="shipping/postcode"/></postcode>
                                <country_id><xsl:value-of select="shipping/country_id"/></country_id>
                                <telephone><xsl:value-of select="shipping/telephone"/></telephone>
                                <mobile><xsl:value-of select="shipping/fax"/></mobile>
                            </shipping>
                            <Gift></Gift>
                            <GiftMsg><xsl:value-of select="gift_message"/></GiftMsg>
                            <orderdate><xsl:value-of select="created_at_timestamp"/></orderdate>

                            <customerid><xsl:value-of select="catalog_id"/></customerid>

                            <CatalogID><xsl:value-of select="catalog_code"/></CatalogID>
                            <CampaignID><xsl:value-of select="campaign_id"/></CampaignID>
                            <shippingcharge><xsl:value-of select="shipping_amount"/></shippingcharge>

                            <shipMethod><xsl:value-of select="shipping_method"/></shipMethod>
                            <delivinstruct><xsl:value-of select="comments"/></delivinstruct>
                            <subtotal><xsl:value-of select="base_subtotal"/></subtotal>
                            <xsl:variable name="subtotal" select="base_subtotal"/>
                            <taxAmount><xsl:value-of select="tax_amount"/></taxAmount>
                            <GrandTotal><xsl:value-of select="grand_total"/></GrandTotal>
                            <xsl:variable name="currencyCode" select="base_currency_code"/>
                            <currency><xsl:value-of select="base_currency_code"/></currency>

                            <paymentMethod>
                                <CCNumber><xsl:value-of select="payment/cc_last4"/></CCNumber>
                                <CCExpiryMonth><xsl:value-of select="payment/cc_exp_month"/></CCExpiryMonth>
                                <CCExpiryYear><xsl:value-of select="payment/cc_exp_year"/></CCExpiryYear>
                                <CCType><xsl:value-of select="payment/cc_type"/></CCType>
                                <CCAuthorizationCode><xsl:value-of select="payment/additional_fields/paypage_order_id"/></CCAuthorizationCode>
                                <CCTransactionID><xsl:value-of select="payment/cc_trans_id"/></CCTransactionID>

                                <PPPayerId><xsl:value-of select="payment/additional_fields/paypal_payer_id"/></PPPayerId>
                                <PPPEmail><xsl:value-of select="payment/additional_fields/paypal_payer_email"/></PPPEmail>
                                <PPPayerStatus><xsl:value-of select="payment/additional_fields/paypal_payer_status"/></PPPayerStatus>
                                <PPAddressStatus><xsl:value-of select="payment/additional_fields/paypal_address_status"/></PPAddressStatus>
                                <PPCorrelationId><xsl:value-of select="payment/additional_fields/paypal_correlation_id"/></PPCorrelationId>
                                <PPECPayerId><xsl:value-of select="payment/additional_fields/paypal_express_checkout_payer_id"/></PPECPayerId>
                                <PPPaymentStatus><xsl:value-of select="payment/additional_fields/paypal_payment_status"/></PPPaymentStatus>
                                <PPPendingReason><xsl:value-of select="payment/additional_fields/paypal_payment_status"/></PPPendingReason>

                            </paymentMethod>

                            <items>
                                <xsl:for-each select="items/item">

                                    <item>
                                        <productid><xsl:value-of select="parent_item/product_attributes/sku"/></productid>
                                        <description><xsl:value-of select="product_attributes/name" /></description>
                                        <colorcode><xsl:value-of select="product_attributes/clrcode"/></colorcode>
                                        <xsl:choose>
                                            <xsl:when test="product_attributes/size_name ='No'"><sizecode></sizecode></xsl:when>
                                            <xsl:otherwise><sizecode><xsl:value-of select="product_attributes/sizecode"/></sizecode></xsl:otherwise>
                                        </xsl:choose>

                                        <xsl:choose>
                                            <xsl:when test="product_attributes/shoe_width_code ='No'"><width></width></xsl:when>
                                            <xsl:otherwise><width><xsl:value-of select="product_attributes/shoe_width_code"/></width></xsl:otherwise>
                                        </xsl:choose>

                                        <MagentoSku><xsl:value-of select="sku"/></MagentoSku>

                                        <quantityordered><xsl:value-of select="round(qty_ordered)"/></quantityordered>

                                        <xsl:choose>
                                            <xsl:when test="qty_backordered > 0">
                                                <quantityBackorder><xsl:value-of select="round(qty_backordered)"/></quantityBackorder>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <quantityBackorder>0</quantityBackorder>
                                            </xsl:otherwise>
                                        </xsl:choose>

                                        <xsl:choose>
                                            <xsl:when test="round(qty_backordered) > 0">
                                                <backorderedMessage><xsl:value-of select="product_attributes/exp_ship_date"/></backorderedMessage>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <backorderedMessage></backorderedMessage>
                                            </xsl:otherwise>
                                        </xsl:choose>

                                        <taxAmount><xsl:value-of select="tax_amount"/></taxAmount>
                                        <currency><xsl:value-of select="$currencyCode" /></currency>
                                        <discountdescription><xsl:value-of select="discount_description"/></discountdescription>

                                        <xsl:choose>
                                            <xsl:when test="string-length(parent_item_id/text())!=0">
                                                <unitprice><xsl:value-of select="parent_item/base_price"/></unitprice>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <unitprice><xsl:value-of select="base_price"/></unitprice>
                                            </xsl:otherwise>
                                        </xsl:choose>

                                        <xsl:choose><xsl:when test="false">
                                            <clearance>Y</clearance>
                                        </xsl:when><xsl:otherwise>
                                            <clearance>N</clearance>
                                        </xsl:otherwise></xsl:choose>


                                        <xsl:choose><xsl:when test="string-length(parent_item_id/text())!=0">
                                            <ExtPrice><xsl:value-of select="parent_item/row_total"/></ExtPrice>
                                        </xsl:when>
                                            <xsl:otherwise>
                                                <ExtPrice><xsl:value-of select="row_total"/></ExtPrice>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </item>
                                </xsl:for-each>
                            </items>
                        </Order>
                    </xsl:for-each>
                </Orders>
            </xsl:template>
        </xsl:stylesheet>
