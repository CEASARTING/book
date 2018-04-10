<#--java左边菜单-->
<#if "${topmenue}" == "java">
<div id="leftmenu">
    <div class="menu2"><a href="/admin/user/find" <#if "${leftmenue}" == "javabase">class="active" </#if>>Java基础</a></div>
    <div class="menu2"><a href="/admin/userGroup/find" <#if "${leftmenue}" == "frame">class="active" </#if>>框架</a></div>

</div>
</#if>

<#--c++左边菜单-->
<#if "${topmenue}" == "c++">
<div id="leftmenu">
    <div class="menu2"><a href="/admin/sale/orderManage/find" <#if "${leftmenue}" == "c++base">class="active" </#if>>c++基础</a></div>
</div>
</#if>

<#--数据结构左边菜单-->
<#if "${topmenue}" == "dataStructure">
<div id="leftmenu">
    <div class="menu2"><a href="/admin/machine/find" <#if "${leftmenue}" == "dataStructure">class="active" </#if>>数据结构</a></div>

</div>
</#if>


<#--数据库-->
<#if "${topmenue}" == "database">
<div id="leftmenu">
    <div class="menu2"><a href="/admin/setting/index" <#if "${leftmenue}" == "mysql">class="active" </#if>>MySQL</a></div>
    <div class="menu2"><a href="/admin/log/index" <#if "${leftmenue}" == "redis">class="active" </#if>>Redis</a></div>
</div>


</#if>
