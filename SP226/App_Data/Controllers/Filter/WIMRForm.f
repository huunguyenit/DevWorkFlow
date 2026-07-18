<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "WIMR">
  <!ENTITY DetailTable "d87">
  <!ENTITY c21 "Số phiếu yêu cầu">
  <!ENTITY c22 "Requisition Number">
  <!ENTITY c31 "Ngày yêu cầu">
  <!ENTITY c32 "Requisition Date">
]>

<dir table="m87$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu yêu cầu lĩnh vật tư" e="Material Requisition"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="&c21;" e="&c22;"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="&c31;" e="&c32;"></header>
    </field>
    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="232" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="292" anchor="4" split="4">
      <item value="100, 100, 337, 8, 58, 50, 100"/>
      <item value="1110101: [ngay_ct].Label, [ngay_ct], [stt_rec], [so_ct].Label, [so_ct]"/>
      <item value="1: [&DetailTable;]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9JZdL8G59SoqzF05WfH5ag3lD1kBuCu8cHL4UhzuH7Pg9Lwi/dmQyl3ihzhHR2f2/DP1R13oHuTO8c5lCP0yGOEUzCa4ZnFfDrbXoauxxw4mk+tHgg9/lU3nM87zPjPnig==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87lxdFI8JeKgtlPwSXTCx2Ttmias7EFgcwnnSElVQsBcKw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9FHxTIUEvJi6MTJ4CXEDv1GoQKPexK7ncn6ClfzHS6azHpHHD+m77bo7A341x6DaOPwSPKQ6C0HIRNCJ9CRnASY3nu7Ki6o+huvFGAJqt+5KN1F1Z3BUJzkcD8HaKpe1rhcFG+dlPqnIc9KtHdxzWOFG1mE5ywUwTBv/NIl/2Z2v3QK1QwpEDgTOhpE036D0Q4a4uLJn7rWgK0C/6gXi0mw=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ngw/e5mUNSQfG0rHhVKw8Cz2hkv0KX2Ig6TmnaiSV1oe6QKjOPtCM85p9Fh6qDglts0Koc+GtrpTjw8o1F5qtc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87mZZTZWmSpVnN2Tw9fy5b7Z5uK5afU8dEPfrZV0SkMnFIp2KxwEvb7M1n8aWNDnWlM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9EtyXG5Dz50BGy1srKRyoFYm5/ztPQciV7O9Mw2JUqeBbtueTL4Xgdpx7Ijp1mG8t9nwylckKF5JrjigCruUzOm+TcvDFDAIYhvvTC8BTtbpfB+rucbtaQcyop7L3rQB2OAVZfDvKUy2vl2bHeGxzLQUZgDEU7N/OyAToq+4ayDt</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9F1mxH/NDeiIx5Eb35/mdOKAWjqxOqvAVIHkCB33P6ojltr9nRNZ0PtiPhubxXbiZnTXKvOJnj9CLsiLpRksx/s=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9E1xAwqunF1QxhTKuknjKkvEOhbrnzwwEkdScw5cZzFP/v6GyBKazTd0g6IAvnPEqw==</encrypted>]]>&Identity;Form$Retrieve$Data(this)';}

      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+l47DW9cHWPgte0StBpJRpDCw/PULq13P7d4VULibu3Mw5qQY820hytsX9NA9UkEcs7vFeMx4Nw+LROKjWFlvk1/MhGYGGtdtr6i9lLavFHB9d2m8rBcfRwlbfNCNZe38bEmtEJjEw+IM0LeCTDL1Y4SQH4mEFKN8Yw0cAR/ufbb6HKmR5jnUgihfXyCMhonRBJw/HkG/nypCd+xzl2lPlDKVQvryETmItnjLFPiqQrw8QhO5P9zs2mXZjVNZK9A/OYJpWE0IXhVe7QaMwe5elZsjtUrAWk0nCBPs8BFhhtOEJJ3cCwpkKwmbji6MUm2A53bcffLaaMm9zJY2zgBJc0dhjU9jSFhAbj2LTeU8S+uc5ur2qNn9aQi0sf8meG+HaHF8NaogS3unq1dCGgZiTJ3sM37BH33ysSxRb8QrrQ6hawcX/aCBqBMDp2sy0l8a1PGkjkHtTrBafirnTJb4b2w5VCviPco7sZpzS+UyXXKXXEeR3HteS3UnmjR8Xt+r88govaKhSynjSLVkZ5eiGayrbsWPzr9a0AgtJg/rj4hkZW5JJ/P8xK3VDkE6Nsbrh4x7W3mnG5fQZ6yRAz0rPZs0Y1qf5LfEqXhQJCC3TJRZ1EKtAt3yZFIwotV3Hg4b</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%QFirECjU/RgLQ4k5nc6GM+YKElmu5+tkOsG9aHJjfRnsMv1Z/oB5S7OYOKRt9vEDpVfTqx+qhEvaTeQIrqLMPmyQ0ACNL+lq9qSSbBya3ETZ/u2mOnnfuIM920j94nn93LX6Bctvab/BEK8NNd07lPzlaEttaQ22okEfhBjiXFk0tZNEQHXIxF047jnmdTT+5pK803iLn2pG2/pSWiIVcU0vhU8ndrSpalDYVRi8jEFv+Eux/bt/zA5vPFh0FvR1yR5vo/ZdFfIiX2cQNgupn5Od/IcXAVEQzCXwcP74A0iWUoQExyOcqZEvFuIubOLo/o7Td8aFn/9ICQBcySULVLQ6pJUAXEr0OpDcIH0xlyqghUbMAeJc3rKQxj/n8cBxrWik74VOfFUUeWIRV2zBKXaJW2DXzKLNUH4KnSQYp6r5fO4vLMxXPB50mkr0nOktf0oe9li1YhIktxzMz/3eO2DKkPKMJM1oM0vdG0NTGWcXjh75x/MlSmErhyAJtZDnVtJ5ngScVxN7xZNIt/pMoMqKWlzABIG+Yzh5JzAnrWGaw8dG0FGhiLpl9mlrrzBLCU2NWBUdv4kFa7xz7d7cG2xLQxv9H1Bbsw5TRUHrNzR2HX7lOWqocNokSerl1LIO9ElUcEedpWW3rRcDm2O3E99ApzlLFE3hPbaku029YEeD1n7jQmZsJ5s7WHzTH+xhJPSUBT/z5NJ1OPrItQfl/JQs6pk/8nBPcMGpReW7xIg=</encrypted>]]>
    </text>
  </script>
</dir>