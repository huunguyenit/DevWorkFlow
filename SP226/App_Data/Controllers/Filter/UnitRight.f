<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="sysunitrights2" code="ma_dvcs, user_id" order="ma_dvcs, user_id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc chi tiết theo đơn vị cơ sở" e="Unit Filter"></title>
  <fields>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1')" check="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID))"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZd/Mlr/9+T9YV6sDcqEs809sl/2uBpmWURxCRSwNxMsTPuX+MIk8DKMu6CzHwkVPsg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2xw7klxrrfK9GCH75IKMeB2zTHsDxHhbiWZSyBSoQCHO04UzKLFOcGE9B9cWPtDEzUpwC7278uAODAIkkk3TkLJuc1tK5hwFh9DUEf1RsJF</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5CItnM0kftsMzwGhwwYWYDih19Id6QZ0wAgzt/qi1l11yqYVYaKLpaEX0ZiQXnf5KjNQWOXkRMn2chi2I06ttY=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MI52blr9G4XaDhiyGn6YkBtDUbHqiu+hZQp5sP7HQ/h0IOVzir+8BIifg1yo4LxR4H2jAoUW+ZOD8k2+2uRq4HrDnkIvvqM9BpUVb9qhWv1AtIwCQP8h2VRv/9CDoxlZQTk8jp2Uso7Bg7/Kcg4bq4pVkONnb3w4qWpkmG7K2BmNLxMEkeXN/8XccWbat+Ew6K8R05BCNupX9k45rG1aZKewaerTeuarcTiwEypko4N/effHU/zLzhBbZICZSUj+TYJEAckgHLIrVkVUASGDjXOI41KEDrEcx5dXCp74i45giDLYCqqcVecBnwHgRMxDkAZmsepumwZYYdlbnTYuHQ4lLTNUdZ7QAmqzFExenJI0UV1YYrevUrMaXMXMfM7SapeNeNy8rxaWDWnHBKobf8I4yuzyIHwGX0Xj4n924Vceg2K21FUMg7c4ujGAE8R0yX5t3KLkHYGifb+uiB5sGJhBVqGtES7Y9/O0+APFgkvUyis0zhjuOGODUMircYTOvQLkq+qS2U20RbQevfcmv8qB5Ig0r6wpG8amTes4i9AmlKHlR0RKnpSPtbGKi9Vpj47JvyoAzaOUnMRiZ4taimCepergdeCQUeOddDDqA7cdY99gpQV+6AkpH7LrfnPOZvFZ0FmSL9N6a1s0j0faYTKHVE1Kr4Q1J7AfvITDLk3Pn/wYo6Y8MKOJSROYiGVxQ==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOwnerRight">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6U5FV9VZVql4xjRYxGI5fhWj0xCUoaVqpk/ujCbigcvzvHtWiP5E4yrUL0QFl0xH0w6jbSLvZ7Ogm2gEtRaA3d2cilNzUvHNcXTbAID6yOf0YXz9V2JcgNQM+Kp8X0wRtU1NaiZhdDtsvuBRIXQDUshIEwGhRJ2Ms7wlx0wyKu1F2tNetKNzTWHMSRVrbwc2qktfgMd9c5cGXrA3ZBLycGL6DDqdR/eeyRYkYgJeqxKxK51gBw441PeWuobUvsBOUnNdtv5wVg0wbn+fTLPteC/Cpw61b3O++n++DQvEyR1mBwpQN0i1F+58emX5pujg0A==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>