<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
]>

<dir table="hrrmhttt" code="ma_ht" order="ma_ht" xmlns="urn:schemas-fast-com:data-dir">
  <title v="yêu cầu kiểm tra" e="Test Requisition"></title>
  <fields>
    <field name="ma_ht" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat" inactivate="true">
      <header v="Mã hình thức" e="Form Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ht" allowNulls="false" inactivate="true">
      <header v="Tên hình thức" e="Form Name"></header>
    </field>
    <field name="ten_ht2" inactivate="true">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_vtr" allowNulls="false" inactivate="true">
      <header v="Vị trí tuyển dụng" e="Vacancy"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
    </field>
    <field name="ten_vtr%l" external="true" defaultValue="''" readOnly="true" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" inactivate="true">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="hrrmhtktr" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="259" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrRMTestRequestDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_ht, ma_ht" e="String: ma_ht, ma_ht"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="319" anchor="4" split="7">
      <item value="100, 40, 60, 100, 137, 100, 8, 58, 50, 100"/>
      <item value="110: [ma_ht].Label, [ma_ht]"/>
      <item value="110000: [ten_ht].Label, [ten_ht]"/>
      <item value="110000: [ten_ht2].Label, [ten_ht2]"/>
      <item value="1101000: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1: [hrrmhtktr]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9uObV7QOkBsfen+WZqTe4IwFfJv01OWgdONIpYeDscaTW2vXB0KexTe/MIDSUClkDXiLEUP43N9WQKCzX6Fxlz6sKIOgHMLgTZWJWKitz38</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1wCG08Iofxvb34CPN0r8iyT8r7LGJQekjyQZLAKXb3WE/v4AUCSGXMg7fNM6FIP0c4h36owKeg7WGn+qgxfBOfFWAkCN/xe70dxejEZh/8n</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HxsMzlj4/+fNkHBNyveLQ8=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GzQ50xeCB16ha62czdLNqNGsDIb/3gg1MfgFmgmUToEwQpNkVKnXN+KOpBWQftaMcjkQW+wb5K8eTFas/YEDOYTxysdDPRDc2dCDNPFtq5HpaUvueNVDS8spmxrFhcSP09rFA/fsUnvN9UKk1kmw8zxB/kxlDlotVClS2gYrLhOuJGTWP0zugWEn065XNyB6B1v7+62BDQkaB2zqP7IFtVSKEZkqDw7f5KzPqRbwM7H</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HxsMzlj4/+fNkHBNyveLQ8=</encrypted>]]>
      </text>
    </command>
    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GS63hYt/pvuOxlugETYTRlFPZw2oXxG3ve7vTls3yfJutZi+L9JXsdmilUKXjN50L99GVLeUR89aX2OfoGW4DYdduz+oThMbVxaDJMRD6De7hjPNxPar1FdDqEIUxjUkM0hV8gLDVsXk5K4hc9vnrjapwPiw5PM45j/ijbvq7s+lhcHIkl7mMkvE1zSEnKeirJSONkd/ScTp2cfZvpFgRIX39a5HjO9/Q5YVC2flBc78dk/i0xMGmp9yDrmTOA8sw==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KOm49ISkBYHP15YooL61OJvWtn3XzW+cWTfDhmb1rvV4K5WUjHMMcgL2V5rBXwM95VDP74g794u/hOUz5rA3ByuP1IQOQDcjc7YWIWcEKwYLKoJp97/PdZSvOoRFRLS1+0wfDnkJAGJ0qYXC6LgupaJbtTcxSclJE61CuF/I5TRBG/REwYXyZ1ylAh8uKW4j1ouojNXMpZwqvCxuo9x6POXidjE7l6xgYVNEo3+DyUuZO23iBuDQZyXNwZmasS4zu8keMyrikPbJ+pRlwCYz+ZENx7nAfqOX6y3BlXnlZa/7lKtzvWbOv8JcTviEXjItVCoSldQcFGx7bKCSM3G6RM5daZywMlG28z5RWrJYBRUZEyXh8RK1mVSMH8g2q52IUEfMsMw2+zt73uKVRV3Dz6WQ7uInAZa1Ry2EpSkZUr2pBjcYBG/hhqp9Iygtrcv+s1j0KLn2LdQ2fIyg+QWaHRE9mgJqCPEUec3qycEe9BIKVr5BVrPrMz3XKMgAkhzxFP6mHIpWyEFAPWg8PzITKduKBBDdHZLcMb0zUZqq/g5g9ZN0TDMoUDX7Yri6wZrKXKOQUPZUEcgxl109tDu1llQ1yrTRI9SzN69vx9kj09/njphdO+Eon0YO/lYcYGvEg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AxzAG4bdJ6ntszIWnWU0gXQ4acLuEfLvYIn2se9aqxCOaHcbqE1AXKS7PRLAokjEokoOkTTPIL+yilgUdQYrE4m/UCvWx9hRnJsTUojVwekHWB7lLQnPuE3p3Up4+aviupS7thtGzmIkkfLLsNmxUPU6GfegeJzkI/7kXUdiKG9SbXQQBeEnr6BX1fs1YkSG1pGqpoBFhSxFCWawLNPCSE3USGggpkyclpHXg9J4nMt4QSlCvn6IMTaPAyg17GxShElaQBjJnGoUIwa1oCQTwkpQF88MscVA+y7NO7shuloq14cEbiI4ItzXmVMhK4EQFUN7VQ5WGvjdA01FKePR3F9W1WEKSmFggPBDy95BN1DhT5YZdhbH+ac8TN6VlZ1Hfpz+7ZWDwODwaZ5h5MMULxFPQaU0s3gG0Sdx3AHVdtoGIkS3htWpQ+tI+mytO31qroiZGD7Us8fsdKj1ypx/CS8s1O1V2KqFdP5WYnwxCMFjI+d1IcB/rVNkr6ziPTeLMB3V51EpH6Ax2huy8WA1cLhzOzWLIx1HRhHslstFlhzXKRLxwl4WI1dfClpYZhRgw==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>