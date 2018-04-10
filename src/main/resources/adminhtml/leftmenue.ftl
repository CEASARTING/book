<#--java左边菜单-->
<#if "${topmenue}" == "java">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/java/javabase" <#if "${leftmenue}" == "javabase">class="active" </#if>>Java基础</a></div>
    <div class="menu2"><a href="/211/book/java/frame" <#if "${leftmenue}" == "frame">class="active" </#if>>框架</a></div>

</div>
</#if>

<#--c++左边菜单-->
<#if "${topmenue}" == "c++">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/cpp/cppbase" <#if "${leftmenue}" == "cppbase">class="active" </#if>>c++基础</a></div>
</div>
</#if>

<#--数据结构左边菜单-->
<#if "${topmenue}" == "dataStructure">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/ds/dataStructure" <#if "${leftmenue}" == "dataStructure">class="active" </#if>>数据结构</a></div>

</div>
</#if>


<#--数据库-->
<#if "${topmenue}" == "database">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/database/mysql" <#if "${leftmenue}" == "mysql">class="active" </#if>>MySQL</a></div>
    <div class="menu2"><a href="/211/book/database/redis" <#if "${leftmenue}" == "redis">class="active" </#if>>Redis</a></div>
</div>


</#if>
