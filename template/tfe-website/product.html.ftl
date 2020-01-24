<#assign inStock = false>
<#if product.productAvailability=="[AstAvailable]"><#assign inStock = true></#if>
<div class="container mt-2">
    <a class="customer-link" href="/store">Home <i class="fas fa-angle-right"></i></a>
    <a class="customer-link">${product.productName}</a>
</div>
<div class="container container-text mt-1">
    <#if addedCorrect?? && addedCorrect == 'true'>
        <div class="alert alert-primary mt-3 mb-3" role="alert">
            <i class="far fa-check-square"></i> You added a ${product.productName} to your shopping cart.
            <a class="float-right" href="/store/d#/checkout">Go to Checkout <i class="fas fa-arrow-right"></i></a>
        </div>
    </#if>
    <div class="row mt-2">
        <div class="col col-lg-1 col-sm-4 col-4">
            <div>
                <#assign imgDetail = false/>
                <#assign imgExists = false/>
                <#list product.contentList as img>
                    <#if img.productContentTypeEnumId == "PcntImageMedium" && img.sequenceNum == 1>
                        <img width="30%" class="figure-img img-fluid" src="tfe-website/assets/${img.contentLocation}">   
                    <#elseif img.productContentTypeEnumId == "PcntImageSmall" && img.sequenceNum == 1> 
                        <img width="30%" class="figure-img img-fluid" src="tfe-website/assets/${img.contentLocation}">
                    <#elseif img.productContentTypeEnumId == "PcntImageLarge" && img.sequenceNum == 1>
                        <img width="30%" class="figure-img img-fluid" src="tfe-website/assets/${img.contentLocation}">
                    </#if>
                    <#if img.productContentTypeEnumId == "PcntImageLarge">
                        <#assign imgExists = true/>
                        <img onClick="changeLargeImage('${img.productContentId}');"
                            class="figure-img img-fluid product-img"
                            src="/tfe-website/assets/productImage/${img.productContentId}"
                            alt="Product Image">
                    </#if>
                </#list>
            </div>
        </div>
        <div class="col col-lg-4 col-sm-8 col-8">
            <img id="product-image-large" class="product-img-select" 
                <#if imgDetail>data-toggle="modal" data-target="#modal2"</#if>>
        </div>
        
        <div class="col col-lg-3">
            <form class="card cart-div" method="post" action="/store/product/addToCart">
                <div>
                    <#if product.listPrice??>
                        <span class="save-circle" v-if="product.listPrice">
                            <span class="save-circle-title">SAVE</span>
                            <span class="save-circle-text">$${(product.listPrice - product.price)?string(",##0.00")}</span>
                        </span>
                    </#if>
                    <div class="form-group col">
                        <div class="cart-form-price">
                            <p>
                                <span class="price-text">$${product.price}</span> 
                                <#if product.listPrice??>
                                    <span>
                                        <span class="product-listprice-text">was</span>
                                        <del>${product.listPrice}</del>
                                    </span>
                                </#if>
                            </p>
                        </div>
                        <hr class="product-hr" style="margin-top: -5px;">
                        <#--
                        <span class="product-description">On sale until midnight or until stocks last.</span>
                        <hr class="product-hr">
                        -->
                    </div>
                    <div class="form-group col">
                        <input type="hidden" value="${product.pseudoId}" name="productId" id="productId" />
                        <input type="hidden" value="${product.priceUomId}" name="currencyUomId" />
                        <input type="hidden" value="${ec.web.sessionToken}" name="moquiSessionToken"/>
                        <span class="product-description">Quantity</span>
                        <select class="form-control text-gdark" name="quantity" id="quantity">
                            <#if productQuantity.productQuantity??>
                                <#list 1..productQuantity.productQuantity as x>
                                    <option value="${x}">${x}</option>
                                </#list>
                            <#else>
                                <option value="0">0</option> 
                            </#if>
                        </select>
                    </div>
                </div>
                <#if inStock>
                    <button onclick="onClickAddButton();" id="cartAdd" class="btn cart-form-btn col" type="submit" onclick="">
                        <i class="fa fa-shopping-cart"></i> Add to Cart
                    </button>
                <#else>
                    <h5 class="text-center">Out of Stock</h5>
                </#if>
            </form>
        </div>
    </div>
    <hr>
</div>


<script>
    var prodImageUrl = "/tfe-website/assets/productImage/";
    var $productImageLarge = document.getElementById("product-image-large");

    document.body.onload = function() {
            var productAvailability = ${product.productAvailability?replace('=',':')};
            var variantIdList = [];
            <#list 0..variantsList.listFeatures.keySet()?size - 1  as x>
                $('#variantProduct${x}').on('change', function() {
                    var productVariantId = $('#productId').val();
                    variantIdList[${x}] = this.value;
                    if(typeof(variantIdList[1]) != 'undefined') {
                        productVariantId = productVariantId + '_' + variantIdList[1] + '_' + variantIdList[0];
                    } else {
                        productVariantId = productVariantId + '_' + variantIdList[0];
                    }
                });
            </#list>
    }

    function onClickAddButton() {
        $('#spinner').show();
    }

    function changeLargeImage(productContentId) { $productImageLarge.src = prodImageUrl + productContentId; }
    //Default image
    <#if product.contentList?has_content && imgExists>
        changeLargeImage("${product.contentList[0].productContentId}");
    <#else>
        $productImageLarge.src = "/store/assets/default.png";
    </#if>
    function setStarNumber(number) {
        var productRating = document.getElementById("productRating");
        productRating.value = number;
    }
</script>