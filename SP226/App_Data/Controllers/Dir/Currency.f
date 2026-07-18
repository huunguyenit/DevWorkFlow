<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnt" code="ma_nt" order="ma_nt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ngoại tệ" e="Currency"></title>
  <fields>
    <field name="ma_nt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nt" allowNulls="false">
      <header v="Tên ngoại tệ" e="Currency Name"></header>
    </field>
    <field name="ten_nt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="tk_pscl_no" allowNulls="false">
      <header v="Tk phát sinh cl nợ" e="Realized Loss Acct."></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pscl_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pscl_no%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_pscl_co" allowNulls="false">
      <header v="Tk phát sinh cl có" e="Realized Gain Acct."></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pscl_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pscl_co%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_dgcl_no" allowNulls="false">
      <header v="Tk đánh giá cl nợ" e="Unrealized Loss Acct."></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dgcl_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dgcl_no%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_dgcl_co" allowNulls="false">
      <header v="Tk đánh giá cl có" e="Unrealized Gain Acct."></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dgcl_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dgcl_co%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ra_ndec" dataFormatString="0" clientDefault="0">
      <header v="&lt;span class=&quot;DoubleTab&quot;&gt;Số lẻ&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Scale&lt;/span&gt;"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="ra_1">
      <header v="&lt;span class=&quot;LabelCenter&quot;&gt;[1]&lt;/span&gt;" e="&lt;span class=&quot;LabelCenter&quot;&gt;[1]&lt;/span&gt;"></header>
      <footer v="&lt;div class=&quot;BreakTab&quot;/&gt;" e="&lt;div class=&quot;BreakTab&quot;/&gt;"></footer>
    </field>
    <field name="ra_2">
      <header v="&lt;span class=&quot;LabelCenter&quot;&gt;[2]&lt;/span&gt;" e="&lt;span class=&quot;LabelCenter&quot;&gt;[2]&lt;/span&gt;"></header>
      <footer v="&lt;span class=&quot;Tab&quot;&gt;Đọc tiền: &lt;/span&gt;&lt;span class=&quot;LabelDescription&quot;&gt;[1]__[2].[3]__[4][5]&lt;/span&gt;" e="&lt;span class=&quot;Tab&quot;&gt;Amount Reading: &lt;/span&gt;&lt;span class=&quot;LabelDescription&quot;&gt;[1]__[2].[3]__[4][5]&lt;/span&gt;"></footer>
    </field>
    <field name="ra_3">
      <header v="&lt;span class=&quot;LabelCenter&quot;&gt;[3]&lt;/span&gt;" e="&lt;span class=&quot;LabelCenter&quot;&gt;[3]&lt;/span&gt;"></header>
    </field>
    <field name="ra_4">
      <header v="&lt;span class=&quot;LabelCenter&quot;&gt;[4]&lt;/span&gt;" e="&lt;span class=&quot;LabelCenter&quot;&gt;[4]&lt;/span&gt;"></header>
    </field>
    <field name="ra_5">
      <header v="&lt;span class=&quot;LabelCenter&quot;&gt;[5]&lt;/span&gt;" e="&lt;span class=&quot;LabelCenter&quot;&gt;[5]&lt;/span&gt;"></header>
    </field>
    <field name="ra_12">
      <header v="&lt;span class=&quot;DoubleTab&quot;&gt;Cách đọc&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Reading Rule&lt;/span&gt;"></header>
    </field>
    <field name="ra_22">
      <header v="&lt;span class=&quot;DoubleTab&quot;&gt;Cách đọc khác&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Other Rule&lt;/span&gt;"></header>
    </field>
    <field name="ra_32">
      <header v="" e=""></header>
    </field>
    <field name="ra_42">
      <header v="" e=""></header>
    </field>
    <field name="ra_52">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 40, 70, 70, 70, 80"/>
      <item value="1100: [ma_nt].Label, [ma_nt]"/>
      <item value="110000000: [ten_nt].Label, [ten_nt]"/>
      <item value="110000000: [ten_nt2].Label, [ten_nt2]"/>
      <item value="110010000: [tk_pscl_no].Label, [tk_pscl_no], [ten_tk_pscl_no%l]"/>
      <item value="110010000: [tk_pscl_co].Label, [tk_pscl_co], [ten_tk_pscl_co%l]"/>
      <item value="110010000: [tk_dgcl_no].Label, [tk_dgcl_no], [ten_tk_dgcl_no%l]"/>
      <item value="110010000: [tk_dgcl_co].Label, [tk_dgcl_co], [ten_tk_dgcl_co%l]"/>
      <item value="100000000: [ra_ndec].Description"/>
      <item value="100000000: [ra_2].Description"/>
      <item value="11: [ra_ndec].Label, [ra_ndec]"/>
      <item value="100000000: [ra_1].Description"/>
      <item value="-1010111: [ra_1].Label, [ra_2].Label, [ra_3].Label, [ra_4].Label, [ra_5].Label"/>
      <item value="11010111: [ra_12].Label, [ra_1], [ra_2], [ra_3], [ra_4], [ra_5]"/>
      <item value="11010111: [ra_22].Label, [ra_12], [ra_22], [ra_32], [ra_42], [ra_52]"/>
      <item value="100000000: [ra_ndec].Description"/>
      <item value="111000000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwe3v4lP+d9YH44qk91xFQUXArQ19MmYOFi7Z7v6HinmMRUHGO6+fT04tJjhSZvyAwY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN2BvdTvG0LQ+uL5tdtkHP5Ghqmg0TYeX2B6EAL9XxvbrMm0iPL9+hun9QTAKMMW1Zs=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3qxr4BVurwMlnYvWazIKPe4GRPkMTeIvOdEChMRoyoORpBOmOPpEAYqGEEC6k5ZJLtz9FBYZqvJ3rczm3lyLr9dkkQjuTTrrhCGF7G6x4UiJ55wEhrUBI0tTnt7Jl2IhNP81c/SmUi2jYedN3FlOq7CZrZDevetZVQM3N2d0z4q61ihwYsJIu0RPv6Jpt6PG2fbGcTOcoNvXV/otPfyDivKLJoYiN8E6PTUCm/ygsUQ34ihuvLJ8Jr/pm3bD0KJnIpKZVeQ54ebU9K+Pix8Soa5PrV2dBuzcrPZ+AzDyzFYVo60PjDwjG1SqMD3KqMPyexzGSJ05z1apQQSk0GUnMWBMMxcdBUhvUntwJu4rVxa367fsMwUuliWw9eWa2W139biljCMO6Zd8IZS23CbWzazqK6+CP2UQVreH9vKbik8aonlkud3PN/Tor6b494RhKbN2W1D0B2DziLViOwnRTzTUTUsJ0pki1jdaM6il1xv1ILBWdTzdWUxmAdn6aUR2RWtBNoyYlsfDrO04SYZk78IgafsxvS3VFqzhFz7mv77wQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nDWbjYv0APEAldzabUY04uhOApfZ1AWIhbJGvEredbFnIE5zYmbWMXBZ3vYTeL7knaQ9p6hSlEKC7Jh5Hcnt1rZ4s/aBs9txMJPZxrat6m7DjPUltdcL2PI2B9ZfJvBm4r2L/A44CLU1DvP3GSjDajVTGqu7JtB5npvxVYhB/YcyIL7IX/FruEXapQev/C+gI/gNmE3ZT2Xzff6jtPNhgEcFGOXfCT7F7WjD6bH/1d9A=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5do627yO1q0wSXmF+B3WQ/WEQBcAAJTI7ECDXCV2FQS+KjfUDAE5W6C667bk5/yKeh3VkLdPj10EpKLE0igzsLZ05jPzGF5sglmx6553YpeAfzTdtNgrB4Eg+hBuexAZM50Z92Pemkxl/2du4jTdFGmhKgQUWe0c9OHacdbmvZo</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHNu+Ln2q3a45aBlTsQF+xshLr1rriG7G6vCdz4NM7AiwcrnvHVzv4BKhq1CJByT5oAWM3aWUe37N8ZB4qERfxCXfBuep7lCZ1+EW/6tnk1TvkQLR9gX+EPvAnNUPt9WJDgNqxRnvniEvypf3e9EDZJ3aQ5HmfEOUOSUQhjj0nqX56/8yOAmbsDm+8GdLT3STkAFMiS1HJ9fyuj6OcvljzJtdEzqvnJOG04edZkQr6sl8D0zFY3b/rJW4fVxwOvFa7TEOKkkCnpiwJSdCo8JeF7m444AfMmLh7++WeefrrJOwuH3KQ+cWXzK11rLw+UcMWRi/bn1EgsRPGpA8dwx+I3hACwJTpaCRvgs6JE16sI8k20Ua3bPceF+3naTiLedgQAYzeb1Ubmt/zGquEQgYr/n0dcNGZ3eS7BdW2W0ziKRts/fcsJAIc+90IOhy/Y0basEct5QQsDetgfVepPE/rQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyBGQVuBGYDm1Xrf5kUdy9zPy/2jv/pcb+6tVjZeWe7OI6HHOrxZeA5N+0v+BGoFmcqZMOj4xSh2BREXAYAihzSG+a/dPfpIqEuiFmn3LrJSgJIAzI0oGl0lLvZIuibCH6a/92e96PXL4eOehLG24oPgnjHT+bTL/VGv31/vlEAU247FUacAaKBNTTwraey9pjJlh4O+oA87l1HFhpuYHvmrccQ2aQo3TEc7HJskFVKiZSvldl7FeN7h9toqD33Rjjcx2goHq+I2sZIlMcRnnk0=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHYNMN/T6nq9cifkIk3SGd0YlX7zg71YlDldgLM9YiiyWzAZCJkPyxeezmEXpmA36wLHdeCvLVI0UOjB8xCEbYWZYTPlbEFHNP+MMChQcjcvWXrOQe1WtBka49qDeF7iBzryA6tpHC26buu0OUk7D3T8Rx/SF2FKa7GFnFcMdfrIdufA2sE0PJEsbxODeip6IUL5zXkeb2wpQReIBX06/faQ1ucQIKmj2fYEJ1tHMbfxH/f63oII41jAlWYXY1VBsXSlcXiggbhasc+PqcnrrdANdy3/Y+Cb3F3Q6T7TYeZOGQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KqB/zIEL1/oThnInRbKYeZc36TByTAZvYrhhZGMHJ0zmbl2EhnGGjFpS1crTdHIi6Q==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkb0o80dLjXrT+/6+Fk0DZOEnI6TwUFth9JXA2LLlVw8l2V6fih5rUwEGUFNWzj3QsCVqc9v3aVu0TpjPO7+kCPUFqowdIVPNVgulaA19hhlRsefizWug3rtvzmz4cmgzOh8Ds1pimys9FbsMVlmwUyQx6hDI1YLw5MBc0JY96MKBLvuDCmACnXLXabL8V2XVX6z+eqbiEHVRwt39Y/6Dv9QyOqyrp+YgaC61zS7lLxqJVqP3F/157VdKoo59PP4f/+qGPW0YHnIATiCpVzGrpLiVn6DYgg7lXQ9UpbL4ISMzTFnwkjDEZy+EtYiRjJAxZ5PCyG1zuD2dTuMx+YknkL1</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIRmkuhMX2UlD6KveKTDA3vAwYVgCyJ4eRvO/0LOmbtxqQtUYlEE4obqGcqw5BLH8oRkews6i4q2CubhARRz03HEB7PM472OVKCaUC+YJGpjjNRydPxSSXLhVk4L839QY9rPybXDMxUKwN8r8mgS/n5U=</encrypted>]]>
    </text>
  </css>
</dir>