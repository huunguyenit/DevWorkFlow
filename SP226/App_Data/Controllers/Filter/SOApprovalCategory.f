<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir table="sodmkieuduyet" code="ma_kieu, loai_duyet" order="ma_kieu, loai_duyet" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_duyet" allowNulls="false">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="SOApprovingType" reference="ten_loai_duyet%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_loai_duyet%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [loai_duyet].Label, [loai_duyet], [ten_loai_duyet%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHtcf/eMQ6JNuhKdkli442Ikf6M7l+c0YsGFLrH4N3/w63GlBYFWQARQEfHlEhFsKlQW2dTIBUZNM8zkDHwsIlD3SIRaxDhMc55Z3vKMsWlZK91lndJq+D7I20a5aJgAb3ZUd1dVvEzcqLzHvmNcdyKATdgfQ029njh5DOSHkZPhta4+LpYu/uwO0263kcHSamJzYHcYtjUFGNtX6XanfjAtJWtl5+x6HntPuJK6isZ3CA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPB9Tryi3R6MZO324Y+kH/CHtKkOphY8RelYbT+nIYkifFGhbkyyNrZDaj92SUc06rpv5ei2XtE3NTlKLgU2bcu3wtxRu5E0herNhzOCDJcUGuB0hv6r4QL8bfcn7sGmpZB50vxkcjbHxzC/FtwpWgzfkFvvlZ4BPfbnzg+UoJTjZdiUoklErnFBiuXRNA4jAjxcugM4Gdjc/1MnyE2y7hEFD91djNBmZAkzSdg6TAUIq9YdD+FVBu0EYh6n1i1+UXrN5bylbb8y4kvDMBtAI48XU6e6Zh4GmQyp0hUjXmG61RAn3UQ3buUq5Jr1C8GwpPHGCiqsoK5lW7vGfjIDIgEmaKWuNUSvzzKM2GQ2QzKQwIQy4k8HePZGlOSd4+ovmxM0cLRmKeBE4BCb52OLLsioGn4wPk5iSQb3j2GSVdzYXZTA9rOBt11FQd6Idnl/AIhHWDXjBX5QNoI4qTTgwp2aolJJYQMlsZYM1odPLL2aYtVbVYrrUStAKVixy7Gd12iFktk1dnEBO5LI6kafhgIfHjrTlSbcUqe3mIlXQ3Rlud2UXPN91Hh52kzpCMrTAY5tySRrV++eD0EUZ0eWAPIsExD8RvpKpT0qyHAIxHtz5WZoYJfOIjAFMn56xpi5FXcI5OD1lApqtA3U4JTWDq23BXXHLY9sRXdcp3ZKAEW54=</Encrypted>]]>
    </text>
  </script>
</dir>