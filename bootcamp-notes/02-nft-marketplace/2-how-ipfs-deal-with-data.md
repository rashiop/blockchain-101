
# How IPFS Deals With Files - IPFS Camp Workshop
![](https://i.ytimg.com/vi/Y_-TWTmF_1I/maxresdefault.jpg)



## Core Course How the IPFS deals with Files [(00:00:00)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=0s)
- The course is titled "How [[InterPlanetary File System | IPFS]] Deals With Files" and is part one of five, presented by Alan, Michael, and Stephen. [(00:00:00)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=0s)
- The course aims to discuss how IPFS deals with files, with a focus on immutability. [(00:00:13)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=13s)
- Immutability refers to the inability to change something, as opposed to mutability, which is the ability to change. [(00:00:33)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=33s)
- IPFS has a big focus on immutability due to the nature of peer-to-peer networks, where there is no central point of authority and no one to implicitly trust. [(00:00:42)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=42s)
- In a peer-to-peer network, data can be easily subverted, and it cannot be relied upon to be the data that was requested, highlighting the importance of resource integrity. [(00:01:06)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=66s)
- The current web model often relies on implicit trust in institutions, such as certificate authorities, social media, and government, but this trust can be easily subverted. [(00:00:59)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=59s)

## INTEGRITY CHECKING [(00:01:17)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=77s)
- To ensure the integrity of data, a hash is calculated from the data itself using cryptography, which provides certain properties like uniqueness and determinism [(00:01:30)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=90s).
- This hash can be shared with others, and when someone receives the data, they can calculate the hash and compare it with the original to verify its integrity [(00:01:54)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=114s).
- If the hashes match, it confirms that the data received is the same as the original data, but if they don't match, it indicates that the data has been tampered with [(00:02:05)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=125s).
- The guarantee of integrity checking is that content is immutable, meaning that if the data changes, the hash will no longer match [(00:02:17)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=137s).
- Verifiability is one of the main reasons for using immutable data, as it allows users to verify the content they receive is the same as the original content [(00:02:23)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=143s).
- In contrast to location addressing, where the content can change but the URL remains the same, content addressing uses a hash to access the content and verify its integrity [(00:03:11)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=191s).
- Immutable content solves the caching problem, as the data will never change, allowing it to be cached forever [(00:03:29)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=209s).

## CACHING & DEDUPING [(00:03:32)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=212s)
- In the context of [[InterPlanetary File System | IPFS]], content addressing assigns a specific address to a file based on its content, meaning if the content changes, the address also changes. This allows the content to be verified, cached, and fetched by anyone. [(00:03:32)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=212s)
- IPFS handles file changes by storing the differences between files, which often share many of the same bytes. This minimizes the amount of data needed to transfer when fetching similar files. [(00:04:01)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=241s)
- Currently, storing and sharing similar files requires storing and transferring both files in full, but IPFS aims to optimize this process. [(00:04:15)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=255s)
- Content addressing in IPFS allows for content to be fetched from any peer, as long as its integrity can be verified, which is not the case with traditional web hosting. [(00:04:36)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=276s)
- IPFS uses a special hash called a CID (Content Identifier) to ensure content integrity and facilitate content addressing. [(00:05:21)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=321s)

## CRYPTOGRAPHIC HASH [(00:05:36)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=336s)
- [[Cryptographic hash function | Cryptographic hash]] functions map inputs of arbitrary size to outputs of a fixed size. [(00:05:36)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=336s)
- These functions have several desired properties: they are deterministic, meaning the same input will always produce the same hash. [(00:05:48)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=348s)
- It should be impossible to invert a cryptographic hash, meaning one cannot reconstruct the original data from the hash. [(00:05:52)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=352s)
- The hash should be unique, ensuring that no two different files produce the same hash. [(00:06:02)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=362s)

## HASHING ALGORITHMS [(00:06:10)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=370s)
- [[InterPlanetary File System | IPFS]] uses a variety of hashing algorithms, with SHA-256 being the default choice [(00:06:10)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=370s).
- Other hashing algorithms available in IPFS include older ones like [[SHA-1]] [(00:06:18)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=378s).
- Older hashing algorithms, such as SHA-1, are considered broken as they have been proven not to be collision-free [(00:06:20)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=380s).
- The issue with broken hashing algorithms is that they may need to be replaced in the future, requiring a switch to a different default hash in IPFS [(00:06:30)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=390s).

## WHICH ALGORITHM? [(00:06:38)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=398s)
- The problem with switching algorithms is that given a hash, it's unclear which algorithm was used to generate it, requiring a future-proof way of identifying the hash function used. [(00:06:39)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=399s)
- Multi-hash is a solution that includes a prefix with two numbers: the algorithm number and the hash length, both of which are encoded as Varints, a compact encoding for integers. [(00:06:57)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=417s)
- The algorithm number is a multi-codec identifier, with predefined values agreed upon and listed in an online table, such as the identifier 18 for SHA-256. [(00:07:30)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=450s)
- The hash length is also encoded as a [[Variable-length quantity | Varint]], with lengths above 127 encoded as 2 bytes, resulting in the hash length being 2 bytes long in the case of SHA-256. [(00:07:48)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=468s)
- Varint encoding is a compact way of encoding integers, with numbers above 127 requiring 2 bytes to encode, which is why the hash length for SHA-256 is 2 bytes long. [(00:08:01)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=481s)

## HOW TO INTERPRET THE DATA? [(00:08:23)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=503s)
- [[InterPlanetary File System | IPFS]] supports multiple encodings, which can include C-BOR ([[CBOR | Concise Binary Object Representation]]), protocol buffers, or [[JSON]], to allow for flexibility in data representation [(00:08:25)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=505s).
- The choice of encoding may depend on factors such as compactness for efficient storage, convenience, or speed, but this creates the problem of determining how to decode the data [(00:08:46)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=526s).
- To address this issue, IPFS uses a metadata prefix, specifically an IPLD (InterPlanetary Linked Data) codec, which tags the encoded data with information about the codec used [(00:09:04)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=544s).
- Currently, any content added to IPFS is encoded using the DAG-PB (Directed Acyclic Graph-Protocol Buffers) codec, which is a compact encoding for data and includes metadata at the start, following the hash [(00:09:12)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=552s).
- The use of protocol buffers (PB) as the encoding method provides a compact representation of the data, and the inclusion of metadata enables the decoding of the data [(00:09:25)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=565s).

## CID VERSION [(00:09:39)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=579s)
- There are two different CID versions: version 0 and version 1, with version 1 being the main version used nowadays and in the future [(00:09:47)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=587s).
- The CID version is indicated by a number prefix added to the front of the CID, which is just a number [(00:10:08)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=608s).
- Version 0 CIDs usually begin with "qm", while version 1 CIDs begin with "baf" or "ba" in some cases [(00:10:27)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=627s).
- CIDs are binary data consisting of zeros and ones, resulting in long strings when printed out [(00:10:38)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=638s).
- The long strings of CIDs do not fit on a slide, so a different representation is used [(00:10:42)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=642s).

## CID STRING [(00:10:48)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=648s)
- Higher number base encoding is used to make strings shorter and easier to print and recognize. [(00:10:49)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=649s)
- A problem arises in interpreting the number base encoding of a string because characters valid in one encoding may also be valid in another. [(00:10:56)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=656s)
- To address this issue, a meta prefix is used to help identify the encoding of the string. [(00:11:14)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=674s)

## MULTIBASE [(00:11:24)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=684s)
- Multi-base helps identify the number base in which the content is encoded, with the first symbol indicating the encoding, such as B for base 52, Z for base 58 [[Bitcoin | BTC]], and M for base 64, and version zero CIDs like QM are also base 58 encoded [(00:11:24)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=684s).
- A CID consists of the CID version, [[InterPlanetary File System | IPFS]] format, multi-codec, and multi-hash, with the multi-hash split into the hashing function used, hash length, and the multi-base encoding applied to the rest of the CID [(00:12:07)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=727s).
- The CID can be broken down into its properties using the CID tool on the IPFS website or the ipfs cid command-line tool, which can also be used to change the number of eighths or the version number of a CID [(00:12:43)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=763s).
- The ipfs cid command-line tool can be used to modify CIDs, and typing ipfs cid --help will provide instructions on how to use it [(00:13:13)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=793s).
- A base 32 encoded CID will start with the symbol B, and the multi-hash will be encoded using the [[IPod | IPOD]] format called dag-pb, with the multi-hash at the end [(00:13:59)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=839s).
- A base 64 encoded CID will start with the symbol M, and the CID version, IPFS format, multi-codec, and multi-hash can be identified using the CID tool or ipfs cid command-line tool [(00:14:48)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=888s).
- A CID can be encoded using different IPLD formats, such as dag-[[CBOR | cbor]], which can be created using the ipfs [[Directed acyclic graph | dag]] API, and this can be identified using the CID tool or ipfs cid command-line tool [(00:15:05)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=905s).
- Version zero CIDs have no multi-base and start with QM, and they are just multi-hashes encoded as base 58 [[Bitcoin | BTC]] [(00:16:20)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=980s).
- [[InterPlanetary File System | IPFS]] addresses content using CIDs (Content Identifiers) and hashes, with CIDs being base 58 encoded multi-hashes that start with 'Qm' [(00:16:47)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1007s).
- Version 0 CIDs are simpler, consisting only of a multi-hash, and do not have a format, CID version, or IPLD format explicitly written [(00:17:22)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1042s).
- The multi-base is always base 58, the CID version is always 0, and the IPLD format is always dag-pb, which are implicit and not written [(00:18:00)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1080s).
- The hash function is always Blake2b-256, which is explicit and included in the multi-hash [(00:18:17)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1097s).
- If any of these variables change, it is no longer a V0 CID [(00:18:40)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1120s).
- IPFS uses data structures, specifically DAGs ([[Directed acyclic graph | Directed Acyclic Graphs]]), to address content [(00:19:01)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1141s).
- A DAG is a tree-like structure where a leaf can have multiple parents, but circular references are not allowed [(00:19:23)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1163s).
- Building hash-based data structures, like DAGs, requires building them backwards, often using recursive functions [(00:19:56)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1196s).
- A DAG is constructed by creating a leaf node, hashing it, and then creating branches that point to the leaf node, with each branch being hashed and used as properties in the root node [(00:20:10)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1210s).
- The resulting data structure can be broken down into smaller blocks, allowing for efficient storage and traversal of large data structures [(00:20:58)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1258s).
- [[InterPlanetary File System | IPFS]] allows for transparent traversal of file structures by following hashes, enabling users to access all related blocks efficiently. [(00:21:20)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1280s)
- Users can traverse the structure more efficiently if they already possess the hash of any branch within the file structure. [(00:21:50)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1310s)
- The system is designed to facilitate easy navigation through the data tree, ensuring that all necessary blocks are retrieved seamlessly. [(00:21:56)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1316s)

## DAG Constraints. [(00:21:59)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1319s)
- IPFS has constraints that prevent circular references, as modifying a node would change the hashes of everything above it, making it impossible to know the hash of the root node upfront unless you have a hash pump in the slip broken [(00:22:36)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1356s).
- Block sizes in [[InterPlanetary File System | IPFS]] are a trade-off, and blocks can be too big or too small, with each size causing different problems [(00:22:57)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1377s).
- Large blocks can cause issues with downloading from multiple peers, as validating the data requires the hash of the entire block, and it's impossible to know who sent bad data if the block doesn't validate [(00:23:15)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1395s).
- Large immutable structures can create orphan blocks when mutated, which can lead to garbage collection problems [(00:23:50)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1430s).
- Different transports may have limitations on block sizes, such as BitSwap having issues with blocks over two megabytes [(00:24:23)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1463s).
- Larger blocks can reduce deduplication, as the only method for deduplication is the hash itself, and smaller blocks can lead to more requests and encoding time [(00:24:35)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1475s).
- Making blocks too small can result in more requests for blocks, increased encoding time, and more round-trip times to I/O, unless a lot of the data is cached in memory [(00:24:58)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1498s).
- The optimal block size is a balance between these trade-offs, and it's essential to consider the limitations of different transports and the impact on deduplication and performance [(00:22:57)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1377s).
- [[InterPlanetary File System | IPFS]] deals with files by breaking them down into smaller blocks, which can lead to less efficient encoding times and increased hashing, resulting in more compute time and potential performance issues [(00:25:30)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1530s).
- The ideal block size depends on the use case, and there is no one-size-fits-all solution, which is why IPFS has created flexible structures for creating blocks and [[Directed acyclic graph | Directed Acyclic Graphs]] (DAGs) [(00:26:04)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1564s).
- Different use cases require different DAG structures, such as optimizing for reads versus writes, and mutable structures may require recreating the graph instead of mutating it [(00:26:18)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1578s).
- IPFS creates a file and chunks it up by pulling the whole file out of disk and running it through the chunker, rather than looking at the existing chunked file and modifying it [(00:26:43)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1603s).
- Different algorithms can be used to create DAGs, such as the HAM algorithm, which guarantees a certain balance and fixed-width tree depth [(00:27:14)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1634s).
- Transport performance issues can also affect block structure trade-offs, such as pulling blocks from an HTTP connection versus a peer network [(00:27:31)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1651s).
- The choice of chunker can depend on the file type, and different chunkers can be used to potentially get better deduplication for different file types [(00:28:27)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1707s).
- [[InterPlanetary File System | IPFS]] has good options for chunkers, but currently requires manual configuration for different data types, rather than being pre-configured [(00:29:06)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1746s).
- The current inefficiency in IPFS is related to the way the [[Directed acyclic graph | Directed Acyclic Graph]] (DAG) leads up to a file, particularly for very small files, as there is no method to inline tiny binaries directly into a file or directory. This issue is expected to be addressed in future updates. [(00:29:21)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1761s)
- In the current implementation, a file's metadata and data are stored in separate blocks, with at least one block for each, and the directory structure is interlocked. Future improvements may allow a single block to contain multiple files. [(00:30:40)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1840s)
- There is no one-to-one mapping between a file and a block or any data structure and a block, allowing for more flexibility in how data is stored and managed. [(00:31:35)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1895s)
- When a file is added to IPFS, it is divided into chunks, which are then arranged into a tree structure known as a DAG. Not all nodes in this structure contain file chunks; some are intermediate nodes. [(00:32:41)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=1961s)

## Calculating CIDs [(00:33:37)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2017s)
- When building a graph in [[InterPlanetary File System | IPFS]], a CID (Content Identifier) is calculated for every node from the bottom up, as the CID is calculated from the data as well as any links it has, and this process cannot be done until the IDs for the children are known [(00:33:42)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2022s).
- The CID calculation process starts at the bottom of the graph, traverses all the way down to the leaf, and then slowly makes its way back up again to finally get to the root CID [(00:34:11)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2051s).
- For a single file, the returned CID is actually the CID of a node at the top of a tree that makes up the file [(00:34:29)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2069s).
- A tool called Dagda IPFS can be used to visualize the graph created by IPFS in a browser, allowing users to drop a file onto it and see the DAG ([[Directed acyclic graph | Directed Acyclic Graph]]) that gets created [(00:35:55)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2155s).
- The graph displays information about each node, including its CID, and allows users to hover over nodes and change settings such as the chunk size, which affects the number of nodes in the graph [(00:36:28)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2188s).
- Changing the chunk size can result in a graph with more or fewer nodes, depending on the amount of data that can be stored in each chunk [(00:36:48)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2208s).
- The default chunk size in [[InterPlanetary File System | IPFS]] is 256 KB, but this can be adjusted to change the number of nodes in the graph [(00:37:08)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2228s).

## WHY VARY THE CHUNK SIZE? [(00:37:23)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2243s)
- IPFS currently uses a default fixed chunk size when adding files, but this size has been changed to smaller chunks, which can improve deduplication but requires more work upfront to create and hash each chunk [(00:37:29)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2249s).
- Larger chunk sizes require less work upfront but can make it easier to traverse nodes when transferring data, while smaller chunk sizes can improve deduplication but may not be as efficient for data transfer [(00:38:05)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2285s).
- Smart chunk sizes can be used to improve seeking in videos or to chunk files in a way that minimizes changes to existing chunks when data is added to the middle of a file [(00:38:23)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2303s).
- Fixed chunk sizes can cause problems when data is added to the middle of a file, as it can throw off the rest of the chunks and reduce deduplication efficiency [(00:38:46)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2326s).
- A smart chunker called Rabin can be used to chunk files in a way that takes into account the addition of data to the middle of a file, and it is available in JavaScript and in the browser [(00:39:14)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2354s).
- Rabin is a clever algorithm that can figure out the appropriate boundaries for chunking a file, but it requires more work upfront to do so [(00:39:41)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2381s).
- [[InterPlanetary File System | IPFS]] currently has two chunkers, fixed and Rabin, but it could potentially have many different chunkers for different file types [(00:40:04)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2404s).
- The visualizer tool can be used to demonstrate deduplication in IPFS, and it can show how two files that are similar but not identical can share many of the same chunks [(00:40:24)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2424s).
- When a file is modified by adding data to the end, the visualizer tool can show how the new file shares many of the same chunks as the original file, with only a few new chunks added at the end [(00:40:37)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2437s).
- IPFS deals with files by breaking them down into chunks, and if two files have similar chunks, they don't take up duplicate storage space, as seen in the example of "joopa" [(00:41:42)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2502s).
- Nodes in the graph are not just made of file data, but are wrapped in a [[Unix | UNIX]] FS wrapper, which can be a file or a directory, allowing for distinction between file data and directories [(00:42:12)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2532s).
- The UNIX FS wrapper adds a few bytes of overhead to every node, which can be seen in the total bytes and bytes of data in a node being slightly different [(00:43:31)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2611s).
- The UNIX FS wrapper can be changed to use "raw leaves", which instead of adding the wrapper, adds a raw buffer of data as the leaf, saving space and resulting in a v1 CID [(00:43:48)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2628s).
- The use of raw leaves means that the bytes total for the nodes are exactly the same as the bytes of the data, without the added wrapper information [(00:44:10)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2650s).
- The difference in CID versions (v0 and v1) is due to the implicit IPLD format, with v0 CIDs having an implicit dag-pb format and v1 CIDs having an explicit IPLD format [(00:45:00)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2700s).
- The IPLD format tells us how to decode the data, and the use of raw leaves results in a v1 CID with an explicit IPLD format [(00:45:13)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2713s).
- The transition to v1 CIDs is currently underway, and specifying CID version 1 when adding files to [[InterPlanetary File System | IPFS]] will result in a v1 CID, but it's a big breaking change due to the difference in CID format [(00:46:02)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2762s).
- IPFS uses a different format for v1 CIDs, which cannot be a v0 CID due to differences in encoding and data structure, making it incompatible with the old format [(00:46:29)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2789s).
- There are different graph layouts in IPFS, including balanced and trickle layouts, each with distinct performance characteristics [(00:46:43)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2803s).
- The balanced layout is the default and simple to build, but difficult to edit, whereas the trickle layout is more complex to build but suitable for streaming due to its faster time to first byte [(00:46:52)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2812s).
- The trickle layout is beneficial for large files, such as movie files, as it allows for faster streaming by reducing the time to first byte [(00:47:15)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2835s).
- Changing the [[Directed acyclic graph | DAG]] layout options results in a different CID, even if the data remains the same, due to the propagation of changes through the intermediate nodes [(00:49:03)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2943s).
- The reason for the different CID is that changing options may result in more or less children, leading to different CIDs for the intermediate nodes, which ultimately affects the root CID [(00:49:24)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2964s).
- If the same chunking algorithm is used, the leaves may still have the same data, but the intermediate nodes will have different CIDs [(00:49:38)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2978s).
- All blocks in [[InterPlanetary File System | IPFS]] include links, which cause the hash to change, resulting in a different CID when the DAG layout options are changed [(00:49:55)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=2995s).
- The choice of DAG layout affects the resulting CID, and using the same chunking algorithm can lead to similar data in the leaves, but different intermediate nodes [(00:50:27)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3027s).
- In most cases, people will use the default [[Breadth-first search | BFS]] adding, which should work correctly, but there is a need to improve the process of building an appropriate DAG for the added file and choosing good options [(00:51:13)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3073s).
- The chunker remains the same due to the city correctly, resulting in unchanged actual chunks, allowing for various duping options [(00:51:28)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3088s).
- Changing the chunk size can be imagined as a service that takes data added using a balanced diet, enabling restructuring [(00:51:39)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3099s).
- A mutable file system is discussed, with a focus on exploring its capabilities within the given time frame [(00:52:00)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3120s).
- The discussion aims to delve deeper into the mutable file system, exploring its features and applications [(00:52:15)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3135s).

## WHAT IS IT? [(00:52:19)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3139s)
- The mutable filesystem (MFS) in [[InterPlanetary File System | IPFS]] is an abstraction that allows users to interact with files as if they were part of a mutable Unix-style filesystem. [(00:52:20)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3140s)
- MFS manages the complexities involved in creating new [[Directed acyclic graph | Directed Acyclic Graph]] (DAG) structures when files are modified. [(00:52:37)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3157s)
- It functions similarly to a tracking system that maps paths to content identifiers (CIDs), enabling users to work with paths and utilize basic commands like move, copy, and make. [(00:52:44)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3164s)

## PITFALLS [(00:53:00)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3180s)
- When addressing files like cat gifs using an immutable hash, the entire IPFS network is available to deliver the file if it is not found locally, as it can be retrieved from another peer on the network. [(00:53:01)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3181s)
- Using an [[InterPlanetary File System | IPFS]] path to access files, such as an important business document, only queries the local node. If the file is not found on the local node, the request will fail, highlighting the absence of a global namespace or shared storage like [[Dropbox]] in IPFS. [(00:53:21)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3201s)
- It is possible to convert an MFS path into a CID using IPFS commands, allowing the file to be shared across the peer-to-peer network. [(00:53:44)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3224s)
- Caution is advised when sharing a CID obtained from MFS, as changes to files in MFS can affect the content associated with the CID. [(00:54:13)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3253s)

## ADDING CONTENT /notes/frogs.txt [(00:54:29)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3269s)
- When adding content to a file, such as updating notes on frogs in a file named /notes/lab/frogs.txt, IPFS handles the changes by creating new nodes and updating the existing directory structure [(00:54:29)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3269s).
- The path /notes/lab/frogs.txt is represented in the [[Directed acyclic graph | Directed Acyclic Graph]] (DAG) as a [[Unix | UNIX]] FS directory, with the root being the current MFS route, which is safe from garbage collection [(00:54:52)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3292s).
- When new data is added to the file, a new chunk is created, and a new node is needed to point to the previous chunks as well as the new chunk, resulting in a new CID for the file [(00:55:17)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3317s).
- The new CID for the file propagates changes to the parent directory, in this case, the notes directory, which also gets a new CID and node because its link has changed [(00:55:41)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3341s).
- The changes continue to propagate up to the root, resulting in a new CID for the MFS root, which [[InterPlanetary File System | IPFS]] keeps track of, making the old root eligible for garbage collection [(00:55:56)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3356s).
- The old nodes and directories may be collected depending on the IPFS settings, but the new MFS root is now the current directory [(00:56:09)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3369s).

## SHARING CONTENT [(00:56:27)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3387s)
- When sharing a CID for a file, if the file is edited, the CID for that file changes, but the recipient is not automatically informed of the change [(00:56:44)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3404s).
- IPFS does not know when a CID is shared with someone else, and the recipient is not guaranteed to be able to access the updated content [(00:56:58)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3418s).
- There is currently no automatic mechanism in [[InterPlanetary File System | IPFS]] to notify the recipient of a CID change [(00:57:25)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3445s).
- In IPFS, names are used for content, but they do not provide information about the content's address, and the content is immutable, yet there is a mutability layer on top of it [(00:57:49)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3469s).
- IPFS has a concept called IPNS, which is a means of addressing mutable content by mapping names to addresses, similar to how DNS maps names to IP addresses [(00:58:11)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3491s).
- IPNS requires a quorum to determine the latest version of the content, which can sometimes take time, and it has some issues [(00:58:31)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3511s).
- To address mutable content using IPNS, the IPNS record needs to be updated every time the content changes, pointing to the new CID [(00:58:51)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3531s).

## Exercise MFS TUTORIAL proto.school [(00:58:57)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3537s)
- A new tutorial for MFS is available on proto.school, a website that teaches people about [[InterPlanetary File System | IPFS]] concepts [(00:59:21)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3561s).
- The MFS tutorial was built for IPFS Camp and covers various topics related to MFS, including coding exercises [(00:59:30)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3570s).
- The tutorial can be found on the home page of proto.school, where users can access it to learn more about MFS and practice their skills [(00:59:34)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3574s).
- The MFS tutorial is designed to help users learn more about MFS and its applications, and can be used to supplement their knowledge [(00:59:46)](https://www.youtube.com/watch?v=Y_-TWTmF_1I&t=3586s).
